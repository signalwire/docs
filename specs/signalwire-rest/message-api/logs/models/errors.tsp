import "../../../types/status-codes/main.tsp";

using Types.StatusCodes;

// Using standard status codes from shared types
// - StatusCode401: Unauthorized
// - StatusCode404: Not Found (for retrieve endpoint)
// - StatusCode422: Unprocessable Entity (for invalid parameters)
// - StatusCode500: Internal Server Error

// No custom error models needed for Message API
// All error responses use standard HTTP status codes
