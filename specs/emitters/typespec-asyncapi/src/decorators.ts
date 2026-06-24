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

export function $event(context: DecoratorContext, target: Model, eventType: string): void {
  context.program.stateMap(stateKeys.event).set(target, eventType);
}

export function getEvent(program: Program, target: Model): string | undefined {
  return program.stateMap(stateKeys.event).get(target);
}

export function $globalEvents(
  context: DecoratorContext,
  target: Namespace,
  ...events: Model[]
): void {
  context.program.stateMap(stateKeys.globalEvents).set(target, events);
}

export function getGlobalEvents(program: Program, target: Namespace): Model[] {
  return program.stateMap(stateKeys.globalEvents).get(target) ?? [];
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
