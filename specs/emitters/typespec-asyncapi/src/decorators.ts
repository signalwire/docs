import { DecoratorContext, Model, Namespace, Operation, Program } from "@typespec/compiler";
import { reportDiagnostic, stateKeys } from "./lib.js";

export interface ServerConfig {
  name: string;
  host: string;
  protocol: string;
  pathname?: string;
  description?: string;
}

export function $server(
  context: DecoratorContext,
  target: Namespace,
  name: string,
  options: { host: string; protocol: string; pathname?: string; description?: string },
): void {
  context.program.stateMap(stateKeys.server).set(target, { name, ...options } satisfies ServerConfig);
}

export function getServer(program: Program, target: Namespace): ServerConfig | undefined {
  return program.stateMap(stateKeys.server).get(target);
}

export function $channel(context: DecoratorContext, target: Operation, method: string): void {
  if (target.kind !== "Operation") {
    reportDiagnostic(context.program, { code: "channel-on-non-op", target });
    return;
  }
  context.program.stateMap(stateKeys.channel).set(target, method);
}

export function getChannel(program: Program, target: Operation): string | undefined {
  return program.stateMap(stateKeys.channel).get(target);
}

export function $reply(context: DecoratorContext, target: Model): void {
  if (target.kind !== "Model") {
    reportDiagnostic(context.program, { code: "reply-on-non-model", target });
    return;
  }
  context.program.stateMap(stateKeys.reply).set(target, true);
}

export function getReply(program: Program, target: Model): boolean {
  return program.stateMap(stateKeys.reply).get(target) === true;
}

export interface BearerAuthConfig {
  bearerFormat?: string;
}

export function $bearerAuth(context: DecoratorContext, target: Namespace, bearerFormat?: string): void {
  context.program.stateMap(stateKeys.bearerAuth).set(target, { bearerFormat } satisfies BearerAuthConfig);
}

export function getBearerAuth(program: Program, target: Namespace): BearerAuthConfig | undefined {
  return program.stateMap(stateKeys.bearerAuth).get(target);
}
