import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { describe, expect, it } from "vitest";
import { asyncApiFor } from "./host.js";

describe("golden", () => {
  it("matches the calling vertical-slice snapshot", async () => {
    const code = readFileSync(
      fileURLToPath(new URL("./fixtures/kitchen-sink.tsp", import.meta.url)),
      "utf8",
    );
    const { yaml } = await asyncApiFor(code);
    await expect(yaml).toMatchFileSnapshot("./__snapshots__/calling.yaml");
  });
});
