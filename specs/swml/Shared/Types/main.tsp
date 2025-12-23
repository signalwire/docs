import "../../../_shared/types/main.tsp";

@doc("A SWML variable reference using \${varname} or %{varname} syntax for dynamic value substitution at runtime.")
@pattern("^[\\$%]\\{.*\\}$")
scalar SWMLVar extends string;
