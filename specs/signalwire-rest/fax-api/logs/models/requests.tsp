using TypeSpec.Http;

model LogListRequest {
  @doc("Include logs for deleted activity.")
  @example(false)
  @query
  include_deleted?: boolean;

  @doc("Return logs for activity prior to this date.")
  @example("2022-04-30")
  @query
  created_before?: string;

  @doc("Return logs for activity on this date.")
  @example("2022-04-30")
  @query
  created_on?: string;

  @doc("Return logs for activity after this date.")
  @example("2022-04-30")
  @query
  created_after?: string;

  @doc("Specify the number of results to return on a single page. The default page size is `50` and the maximum is `1000`.")
  @example(20)
  @query
  page_size?: int32;
}
