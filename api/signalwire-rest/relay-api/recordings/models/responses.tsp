model RecordingResponse {
  @doc("Unique ID of the recording.")
  @example("d369a402-7b43-4512-8735-9d5e1f387814")
  id: string;

  @doc("Unique ID of the project.")
  @example("d369a402-7b43-4512-8735-9d5e1f387814")
  project_id: string;

  @doc("Relay PSTN leg ID associated with the recording.")
  @example("relay_leg_12345")
  relay_pstn_leg_id: string;

  @doc("Date and time when the recording was created.")
  @example(utcDateTime.fromISO("2024-10-17T14:14:53Z"))
  created_at: utcDateTime;

  @doc("Date and time when the recording was last updated.")
  @example(utcDateTime.fromISO("2024-10-17T14:14:53Z"))
  updated_at: utcDateTime;

  @doc("Duration of the recording in seconds.")
  @example(2)
  duration_in_seconds: int32;

  @doc("Error code if the recording failed.")
  @example(null)
  error_code: string | null;

  @doc("Price of the recording.")
  @example(0.05)
  price: float;

  @doc("Currency unit for the price.")
  @example("USD")
  price_unit: string;

  @doc("Status of the recording.")
  @example("completed")
  status: string;

  @doc("URL of the recording file.")
  @example("https://example.com/recording.mp3")
  url: url;

  @doc("Indicates whether the recording is stereo.")
  @example(false)
  stereo: boolean;

  @doc("Size of the recording file in bytes.")
  @example(10)
  byte_size: int32 | null;

  @doc("Audio track of the recording.")
  @example("inbound")
  track: string;

}

model RecordingListResponse {
  data: RecordingResponse[];
  links: RecordingPaginationResponse;
}

model RecordingPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/relay/rest/recordings?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/relay/rest/recordings?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/relay/rest/recordings?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;
}
