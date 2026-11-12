import { execFileSync } from "node:child_process";
import { mkdtempSync, readFileSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { describe, expect, it } from "vitest";
import { asyncApiFor } from "./host.js";

const CLI_VERSION = "6.0.2";

describe("official AsyncAPI CLI conformance", () => {
  it("emitted kitchen-sink output is valid per the official AsyncAPI CLI", async () => {
    const code = readFileSync(
      fileURLToPath(new URL("./fixtures/kitchen-sink.tsp", import.meta.url)),
      "utf8",
    );
    const { yaml } = await asyncApiFor(code);
    const file = join(mkdtempSync(join(tmpdir(), "asyncapi-")), "asyncapi.yaml");
    writeFileSync(file, yaml);

    let output = "";
    let status = 0;
    try {
      output = execFileSync("npx", ["-y", `@asyncapi/cli@${CLI_VERSION}`, "validate", file], {
        encoding: "utf8",
        env: { ...process.env, SUPPRESS_NO_CONFIG_WARNING: "1" },
      });
    } catch (e: any) {
      status = e.status ?? 1;
      output = `${e.stdout ?? ""}${e.stderr ?? ""}`;
    }
    if (status !== 0 || !/0 errors/.test(output)) console.error(output);
    expect(status).toBe(0);
    expect(output).toMatch(/0 errors/);
  }, 180_000);
});
