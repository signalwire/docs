import { createTypeSpecLibrary, paramMessage } from "@typespec/compiler";

export const $lib = createTypeSpecLibrary({
  name: "@signalwire/typespec-webhook",
  diagnostics: {
    "duplicate-name": {
      severity: "error",
      messages: {
        default: paramMessage`Webhook key '${"name"}' is already claimed by operation '${"other"}'. Webhook keys must be unique across the service.`,
      },
    },
  },
  state: {
    webhooks: {
      description: "Operations marked `@webhook`, mapped to their `webhooks` object key.",
    },
  },
});

export const { reportDiagnostic, createDiagnostic, stateKeys: WebhookStateKeys } = $lib;
