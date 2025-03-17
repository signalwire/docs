import "../../../types";

using TypeSpec.Http;
using Types;

model RecordingPathID {
  @doc("Unique ID of a Recording.")
  @path
  id: uuid
}

