import "@typespec/http";
import "../../../types/status-codes";

using TypeSpec.Http;
using Types.StatusCodes;

@doc("Validation error response for token operations.")
model TokenValidationError is ValidationError;
