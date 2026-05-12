import "@typespec/openapi";

using TypeSpec.OpenAPI;

alias number = integer | float;

@format("uuid")
@doc("Universal Unique Identifier.")
scalar uuid extends string;

@format("jwt")
scalar jwt extends string;
