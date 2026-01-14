import "@typespec/http";
import "../_shared/models.tsp";

using TypeSpec.Http;

@doc("Stream response object.")
model StreamResponse {
  @doc("A unique identifier for the stream")
  id?: string;

  @doc("RTMP or RTMPS url. This must be the address of a server accepting incoming RTMP/RTMPS streams.")
  @example("rtmp://broadcaster")
  url?: string;

  @doc("The type of stream.")
  @example("rtmp")
  stream_type?: string;

  @doc("The stream's width.")
  width?: int32;

  @doc("The stream's height.")
  height?: int32;

  @doc("The stream's fps")
  @example(20)
  fps?: int32;

  @doc("Timestamp when the stream was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the stream was last updated.")
  updated_at?: utcDateTime;
}

@doc("Request body for creating a stream.")
model CreateStreamRequest {
  @doc("RTMP or RTMPS url. This must be the address of a server accepting incoming RTMP/RTMPS streams.")
  @example("rtmp://broadcaster")
  url?: string;
}

@doc("Request body for updating a stream.")
model UpdateStreamRequest {
  @doc("RTMP or RTMPS url. This must be the address of a server accepting incoming RTMP/RTMPS streams.")
  @example("rtmp://broadcaster")
  url?: string;
}

@doc("List streams response.")
model ListStreamsResponse {
  @doc("List of streams.")
  data?: StreamResponse[];
}
