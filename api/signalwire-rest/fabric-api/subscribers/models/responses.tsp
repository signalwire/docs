import "./core.tsp";

model SubscriberResponse {
  @doc("Unique ID of the request.")
  @example("d369a402-7b43-4512-8735-9d5e1f387814")
  id: string;

  @doc("Unique ID of the project.")
  @example("d369a402-7b43-4512-8735-9d5e1f387814")
  project_id: string;

  @doc("Display name of the Subscriber.")
  @example("John Doe")
  display_name: string;

  @doc("Type of the resource.")
  type: "subscriber";

  @doc("Date and time when the resource was created.")
  @example(utcDateTime.fromISO("2024-10-17T14:14:53Z"))
  created_at: utcDateTime;

  @doc("Date and time when the resource was updated.")
  @example(utcDateTime.fromISO("2024-10-17T14:14:53Z"))
  updated_at: utcDateTime;

  @doc("Subscriber data.")
  subscriber: Subscriber;
}

model SubscriberListResponse {
  data: SubscriberResponse[];
  links: SubscriberPaginationResponse;
}

model SubscriberPaginationResponse {
  @doc("Link of the current page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/subscribers?page_number=0&page_size=50")
  self: url;

  @doc("Link to the first page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/subscribers?page_number=0&page_size=50")
  first: url;

  @doc("Link to the next page")
  @example("https://{space_name}.signalwire.com/api/fabric/resources/subscribers?page_number=1&page_size=50&page_token=PAbff61159-faab-48b3-959a-3021a8f5beca")
  next: url;
}
