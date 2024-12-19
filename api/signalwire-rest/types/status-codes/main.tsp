import "@typespec/http";

using TypeSpec.Http;


namespace Types.StatusCodes {
  @error
  model StatusCode404 {
      @statusCode statusCode: 404;
      @bodyRoot error: "Not Found"
    }

  @error
  model StatusCode401 {
    @statusCode statusCode: 401;
    @bodyRoot error: "Unauthorized"
  }

  model StatusCode422Error {

      @doc("Error type.")
      type: string;

      @doc("Error code.")
      code: string;

      @doc("Error details.")
      message: string;

      @doc("Request parameter associated with this error.")
      attribute: string;

      @doc("Link to developer resource for this error.")
      url: string;
    }

    @error
    model StatusCode422 {
      @statusCode statusCode?: 422;

      errors: StatusCode422Error[]
    }
  }

