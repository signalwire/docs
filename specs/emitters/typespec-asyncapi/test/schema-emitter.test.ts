import { deepStrictEqual, strictEqual } from "assert";
import { describe, it } from "vitest";
import { createSchemaRegistry, typeToSchema } from "../src/schema-emitter.js";
import { Tester } from "./host.js";

async function compileModels(def: string) {
  const { program } = await Tester.compile(def);
  return program;
}

describe("typeToSchema", () => {
  it("converts a simple model to a JSON-schema object", async () => {
    const program = await compileModels(`model Foo { a: string; b?: int32; }`);
    const Foo = program.getGlobalNamespaceType().models.get("Foo")!;
    const s = typeToSchema(program, Foo, () => ({}));
    deepStrictEqual(s, {
      type: "object",
      required: ["a"],
      properties: { a: { type: "string" }, b: { type: "integer", format: "int32" } },
    });
  });

  it("converts arrays and string-literal unions to enums", async () => {
    const program = await compileModels(`model Foo { items: string[]; state: "a" | "b"; }`);
    const Foo = program.getGlobalNamespaceType().models.get("Foo")!;
    const s: any = typeToSchema(program, Foo, () => ({}));
    deepStrictEqual(s.properties.items, { type: "array", items: { type: "string" } });
    deepStrictEqual(s.properties.state, { type: "string", enum: ["a", "b"] });
  });
});

describe("constraints, defaults, and examples", () => {
  it("emits JSON-Schema constraint keywords, default, and examples from decorators", async () => {
    const program = await compileModels(`
      model Foo {
        @minValue(0) @maxValue(100) count?: int32 = 30;
        @minLength(1) @maxLength(64) @pattern("^[a-z]+$") name: string;
        @minItems(1) @maxItems(5) tags: string[];
        @secret token: string;
        @format("uri") link: string;
      }
    `);
    const Foo = program.getGlobalNamespaceType().models.get("Foo")!;
    const s: any = typeToSchema(program, Foo, () => ({}));
    deepStrictEqual(s.properties.count, {
      type: "integer",
      format: "int32",
      minimum: 0,
      maximum: 100,
      default: 30,
    });
    deepStrictEqual(s.properties.name, {
      type: "string",
      minLength: 1,
      maxLength: 64,
      pattern: "^[a-z]+$",
    });
    deepStrictEqual(s.properties.tags, {
      type: "array",
      items: { type: "string" },
      minItems: 1,
      maxItems: 5,
    });
    strictEqual(s.properties.token.format, "password");
    strictEqual(s.properties.link.format, "uri");
    // count is optional (has default) → not required; name/tags/token/link required
    deepStrictEqual(s.required, ["name", "tags", "token", "link"]);
  });
});

describe("@deprecated", () => {
  it("emits deprecated: true for deprecated properties and models", async () => {
    const program = await compileModels(`
      model Foo {
        #deprecated "use newField"
        oldField?: string;
      }
      #deprecated "use NewModel"
      model OldModel { x: string; }
    `);
    const ns = program.getGlobalNamespaceType();
    const foo: any = typeToSchema(program, ns.models.get("Foo")!, () => ({}));
    const old: any = typeToSchema(program, ns.models.get("OldModel")!, () => ({}));
    strictEqual(foo.properties.oldField.deprecated, true);
    strictEqual(old.deprecated, true);
  });
});

describe("@encode and @encodedName", () => {
  it("decays @encode to the wire type + format and renames via @encodedName", async () => {
    const program = await compileModels(`
      model Foo {
        @encode("rfc3339") createdAt: utcDateTime;
        @encode("seconds", int32) ttl: duration;
        @encodedName("application/json", "from_number") fromNumber: string;
      }
    `);
    const Foo = program.getGlobalNamespaceType().models.get("Foo")!;
    const s: any = typeToSchema(program, Foo, () => ({}));
    // utcDateTime + rfc3339 → string/date-time
    deepStrictEqual(s.properties.createdAt, { type: "string", format: "date-time" });
    // duration encoded as int32 seconds → integer (no format)
    deepStrictEqual(s.properties.ttl, { type: "integer", format: "int32" });
    // @encodedName remaps the JSON property key
    strictEqual("from_number" in s.properties, true);
    strictEqual("fromNumber" in s.properties, false);
    deepStrictEqual(s.required, ["createdAt", "ttl", "from_number"]);
  });
});

describe("$ref property metadata", () => {
  it("attaches description/default to a named-union (enum) property via allOf", async () => {
    const program = await compileModels(`
      union Reason { "hangup", "busy" }
      model Foo {
        /** Why the call ended. */
        reason?: Reason = "hangup";
        plain?: Reason;
      }
    `);
    const reg = createSchemaRegistry(program);
    const Foo = program.getGlobalNamespaceType().models.get("Foo")!;
    reg.refFor(Foo);
    const foo: any = reg.schemas.Foo;
    // metadata-bearing ref → allOf wrapper preserves description + default
    deepStrictEqual(foo.properties.reason, {
      description: "Why the call ended.",
      default: "hangup",
      allOf: [{ $ref: "#/components/schemas/Reason" }],
    });
    // bare ref with no metadata stays a clean $ref
    deepStrictEqual(foo.properties.plain, { $ref: "#/components/schemas/Reason" });
  });
});

describe("createSchemaRegistry — discriminated inheritance", () => {
  it("emits @discriminator base + extends variants as allOf-inheritance", async () => {
    const program = await compileModels(`
      @discriminator("type") model Device { type: string; }
      model PhoneDevice extends Device { type: "phone"; from_number: string; }
      model SipDevice extends Device { type: "sip"; from: string; }
    `);
    const Device = program.getGlobalNamespaceType().models.get("Device")!;
    const reg = createSchemaRegistry(program);
    reg.refFor(Device);
    const s: any = reg.schemas;

    // base: required string discriminator
    strictEqual(s.Device.discriminator, "type");
    deepStrictEqual(s.Device.required, ["type"]);
    strictEqual(s.Device.properties.type.type, "string");

    // variants: allOf-inherit the base, override the discriminator to a const
    deepStrictEqual(s.PhoneDevice.allOf[0], { $ref: "#/components/schemas/Device" });
    deepStrictEqual(s.PhoneDevice.allOf[1].properties.type, { type: "string", const: "phone" });
    deepStrictEqual(s.SipDevice.allOf[1].properties.type, { type: "string", const: "sip" });
  });
});
