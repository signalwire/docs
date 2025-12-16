@summary("Return object")
model Return {
  @summary("return")
  @doc("Return from `execute` or exit script. Takes user-defined key to be used to store the value.")
  @example(#{ status: "success", result: "completed" })
  `return`: unknown;
}
