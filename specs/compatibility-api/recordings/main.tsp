import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/Recordings")
namespace CompatibilityAPI.Recordings {
  @tag(RECORDINGS_TAG)
  @friendlyName("Recordings")
  interface Recordings {
    @operationId("list_recordings")
    @summary("List all Recordings")
    @doc("""
      List all recordings.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    list(
      ...RecordingsAccountSidPath,
      @query @doc("The date, in RFC 2822 format, on which the recording was created.") DateCreated?: string,
      @query @doc("The unique identifier for the call that is associated with this recording.") CallSid?: string,
      @query @doc("The unique identifier for the conference that is associated with this recording.") ConferenceSid?: string,
    ): RecordingListResponse | StatusCode401;

    @operationId("retrieve_recording")
    @summary("Retrieve a Recording.")
    @doc("""
      Retrieve a single recording media or its metadata.

      This endpoint supports two different access methods with different authentication requirements:

      ## Public Access (No Authentication Required)

      Recording audio files can be accessed directly without authentication. This is useful for external applications
      to embed recording URLs without exposing SignalWire API credentials. SignalWire recording URLs are long
      and random, making them difficult to guess or exploit unless you reveal the URL.

      **Retrieve WAV file**

      When a recording URI has no extension or a `.wav` extension, the request
      will return a binary WAV version of the recording file.

      `GET https://example.signalwire.com/api/laml/2010-04-01/Accounts/{AccountSid}/Recordings/{Sid}`

      `GET https://example.signalwire.com/api/laml/2010-04-01/Accounts/{AccountSid}/Recordings/{Sid}.wav`

      **Retrieve MP3 file**

      Setting an extension of ".mp3" on the URI returns a binary MP3 version
      of the recording. For example:

      `GET https://example.signalwire.com/api/laml/2010-04-01/Accounts/{AccountSid}/Recordings/{Sid}.mp3`

      ## Authenticated Access (Voice Scope Required)

      **Retrieve Metadata**

      A recording's metadata, such as duration, cost, time, can be returned by
      setting the Recording URI's extension to `.json`. This requires authentication
      with a Voice-scoped API token.

      `GET https://example.signalwire.com/api/laml/2010-04-01/Accounts/{AccountSid}/Recordings/{Sid}.json`

      #### Permissions
      The API token must include the following scopes: _Voice_. This permission is only required for authenticated requests to retrieve recording metadata (.json extension).
      """)
    @route("/{Sid}")
    read(...RecordingsAccountSidPath, ...RecordingSidPath): RecordingResponse | StatusCode401 | StatusCode404;

    @operationId("delete_recording")
    @summary("Delete a Recording.")
    @doc("""
      Delete recording. If the delete is successful, a 204 response, with no body, will be returned.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @delete
    @route("/{Sid}")
    delete(...RecordingsAccountSidPath, ...RecordingSidPath): StatusCode204 | StatusCode401 | StatusCode404;
  }
}
