// Import necessary modules or types
import "@typespec/http";
import "./models/core.tsp";
import "./models/responses.tsp";

using TypeSpec.Http;
using Types.StatusCodes;

// Define the API path for subscribers
@route("/recordings")
namespace RelayAPI.Recordings {
  @tag("Recordings")
  @friendlyName("Recordings")
  interface Recordings {
    @summary("List Relay Recordings")
    list():
      RecordingListResponse |
      StatusCode401 |
      StatusCode404;


      @summary("Get Relay Recording")
      get(...RecordingPathID):
      { @statusCode statusCode: 200; @body body: RecordingResponse; } |
      StatusCode401 |
      StatusCode404;

      @summary("Delete Relay Recording")
      @delete
      delete(...RecordingPathID):
      { @statusCode statusCode: 204; } |
      StatusCode401 |
      StatusCode404;

  }
}
