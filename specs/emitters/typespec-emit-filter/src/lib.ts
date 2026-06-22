import { createTypeSpecLibrary } from "@typespec/compiler";

export const $lib = createTypeSpecLibrary({
  name: "@signalwire/typespec-emit-filter",
  diagnostics: {},
  state: {
    excludeFromEmit: {
      description: "Types to exclude from emission within the decorated scope.",
    },
    selfExclude: {
      description: "The decorated type itself is excluded from emission wherever it appears.",
    },
  },
});

// NOTE: no package `$flags` for value marshalling — `@excludeFromEmit` takes only
// *type* arguments, which the compiler passes to the implementation as-is
// regardless of marshalling (see the create-decorators doc). `valueof` value
// marshalling does not apply here.

export const { reportDiagnostic, createDiagnostic, stateKeys: EmitFilterStateKeys } = $lib;
