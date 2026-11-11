namespace SWML.Calling;
@summary("return Method")
model Return {
  @summary("return")
  @doc("""
    Return a value from an execute call or exit the script.
    The value can be a string, number, object, or array. Booleans and `null` can appear inside an object or array, or result from resolving a variable reference,
    but are not accepted directly as the whole return value.
    SWML variables and expressions are resolved before the value is stored: in a string value, and in every string inside an object or array.
    Object keys are not resolved. A string that is a single variable reference keeps that variable's JSON type; a reference combined with other text produces a string.
    After resolution, the value can nest objects and arrays at most 62 levels deep. A deeper value is not stored, `return_value` keeps its previous value if it had one,
    and the section still ends.
    """)
  @example(#{ status: "success", result: "completed" })
  `return`: unknown;
}
