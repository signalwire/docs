// TypeSpec library shell for the @webhook decorator. Exposes diagnostic
// codes and a state symbol via the canonical createTypeSpecLibrary path,
// so misuse surfaces as proper TypeSpec diagnostics in the IDE / CLI
// rather than silent no-ops.
import { createTypeSpecLibrary, paramMessage } from "@typespec/compiler";

export const $lib = createTypeSpecLibrary({
  name: "@signalwire/webhook",
  diagnostics: {
    "not-in-service": {
      severity: "error",
      messages: {
        default: `@webhook target must be inside a @service namespace.`,
      },
    },
    "invalid-payload": {
      severity: "error",
      messages: {
        default: `@webhook payload must be a Model.`,
      },
    },
    "duplicate-name": {
      severity: "warning",
      messages: {
        default: paramMessage`Webhook '${"name"}' is already declared with a different payload; first declaration wins.`,
      },
    },
  },
  state: {
    webhooks: {
      description: "Per-service-namespace map of webhook name → registration entry.",
    },
  },
});

export const { reportDiagnostic, stateKeys } = $lib;
