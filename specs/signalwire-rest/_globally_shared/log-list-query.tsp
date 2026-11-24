import "@typespec/http";

using TypeSpec.Http;

namespace SignalWireAPI;

/**
 * Date filters and cursor paging shared by the five log lists: voice, message, fax, video,
 * and conference logs. All five read the same contract, so they share one model. Fax, video,
 * and conference logs also honor `include_deleted` and declare it on their own request
 * models; voice and message logs ignore it, so it does not belong here.
 */
@doc("Date filters and paging for the log list endpoints.")
model LogListQuery {
  @doc("Return logs created at or before this time. Accepts a date (`YYYY-MM-DD`), an ISO 8601 timestamp, or Unix time in seconds. A date is read as midnight UTC at the start of that day, so logs from that day are left out. A timestamp without `Z` or a UTC offset is read as UTC.")
  @example("2026-11-08")
  @query
  created_before?: string;

  @doc("Return logs created during this UTC day. Accepts the same formats as `created_before`. A timestamp selects the whole UTC day that contains it.")
  @example("2026-11-02")
  @query
  created_on?: string;

  @doc("Return logs created at or after this time. Accepts the same formats as `created_before`. A date is read as midnight UTC at the start of that day, so logs from that day are included.")
  @example("2026-11-01")
  @query
  created_after?: string;

  @doc("The page index, starting at `0`. Any value above `0` also requires `page_token`.")
  @example(0)
  @query
  @minValue(0)
  page_number?: int32 = 0;

  @doc("The number of results per page. The default is `50` and the maximum is `1000`.")
  @example(50)
  @query
  @minValue(1)
  @maxValue(1000)
  page_size?: int32 = 50;

  @doc("The cursor for any page after the first. Take it from the `links.next` or `links.prev` URL of the previous response.")
  @example("PAb7182dc2-00f3-40e4-a5ce-20f164b329df")
  @query
  page_token?: string;
}

/**
 * Ordering, link, and history-window behavior shared by the log list operations.
 * Use in the operation's @doc, before the permissions block.
 */
alias logListBehavior = """
  Results are sorted newest first. Each `links.next` URL carries your filters along with the `page_token` for the next page, so follow it as given.

  Lists return at most one year of history. Logs created before the start of the UTC day one year ago are never returned. A `created_before`, `created_on`, or `created_after` value earlier than that returns `422` with the code [`exceeds_history_logs_limit`](/docs/apis/error-codes#exceeds_history_logs_limit).
  """;
