import "@typespec/http";
import "../_shared/models.tsp";

using TypeSpec.Http;

@doc("Conference size options.")
enum ConferenceSize {
  @doc("Small conference")
  small,

  @doc("Medium conference")
  medium,

  @doc("Large conference")
  large,
}

@doc("Theme color properties for conferences.")
model ConferenceThemeColors {
  @doc("Used for CTA buttons and selected items.")
  @example("#044EF4")
  dark_primary?: string = "#044EF4";

  @doc("Main background color.")
  @example("#FFFFFF")
  dark_background?: string = "#FFFFFF";

  @doc("Main foreground color.")
  @example("#1D2127")
  dark_foreground?: string = "#1D2127";

  @doc("Used for success indications.")
  @example("#17BB58")
  dark_success?: string = "#17BB58";

  @doc("Used for error indications.")
  @example("#F42C50")
  dark_negative?: string = "#F42C50";

  @doc("Used for CTA buttons and selected items.")
  @example("#044EF4")
  light_primary?: string = "#044EF4";

  @doc("Main background color.")
  @example("#FFFFFF")
  light_background?: string = "#FFFFFF";

  @doc("Main foreground color.")
  @example("#1D2127")
  light_foreground?: string = "#1D2127";

  @doc("Used for success indications.")
  @example("#17BB58")
  light_success?: string = "#17BB58";

  @doc("Used for error indications.")
  @example("#F42C50")
  light_negative?: string = "#F42C50";
}

@doc("Base conference properties.")
model ConferenceBaseProperties {
  @doc("A named unique identifier for the room. Allowed characters: `A-Za-z0-9_-`. Maximum of 100 characters.")
  @example("my_room")
  name?: string;

  @doc("Display name of the video conference. Maximum of 200 characters. Defaults to the value of name.")
  @example("My Conference's Name")
  display_name?: string;

  @doc("Description of the room. Maximum of 3000 characters.")
  @example("This room will be used for full company all hands meetings")
  description?: string;

  @doc("Conference does not accept new participants before this time. Expects RFC 3339 datetime: `2022-01-01T23:59:60Z`. Date only: `2022-01-01` will be converted to `2022-01-01T00:00:00Z`")
  @example(utcDateTime.fromISO("2022-01-01T00:00:00Z"))
  join_from?: utcDateTime;

  @doc("Conference stops accepting new participants at this time, but keeps running until all participants leave. Expects RFC 3339 datetime: `2022-01-01T23:59:60Z`. Date only: `2022-01-01` will be converted to `2022-01-01T00:00:00Z`")
  @example(utcDateTime.fromISO("2022-12-31T23:59:59Z"))
  join_until?: utcDateTime;

  @doc("The conference's resolution. Allowed values are `720p` or `1080p`.")
  @example("720p")
  quality?: string = "720p";

  @doc("The conference's initial layout. See documentation for a full list of supported layouts.")
  @example("grid-responsive")
  layout?: string = "grid-responsive";

  @doc("The size of the video conference. Allowed values are `small`, `medium` and `large`. See documentation for a list of size limitations.")
  @example("medium")
  size?: string = "medium";

  @doc("Specifies whether to start recording a Conference Session when one is started for this Conference")
  @example(true)
  record_on_start?: boolean;

  @doc("Whether a video with a preview of the content of the conference is to be generated.")
  @example(true)
  enable_room_previews?: boolean;

  @doc("Enables group chat for all participants of the room.")
  @example(true)
  enable_chat?: boolean = true;

  ...ConferenceThemeColors;
}

@doc("Request body for creating a conference.")
model CreateConferenceRequest {
  ...ConferenceBaseProperties;
}

@doc("Request body for updating a conference.")
model UpdateConferenceRequest {
  ...ConferenceBaseProperties;
}

@doc("Conference response object.")
model ConferenceResponse {
  @doc("A unique identifier for the video conference")
  @example("c22d24f6-5a47-4597-9a23-c7d01e696b92")
  id?: string;

  ...ConferenceBaseProperties;

  @doc("Timestamp when the conference was created.")
  @example(utcDateTime.fromISO("2022-01-01T10:00:00Z"))
  created_at?: utcDateTime;

  @doc("Timestamp when the conference was last updated.")
  @example(utcDateTime.fromISO("2022-01-01T11:00:00Z"))
  updated_at?: utcDateTime;

  @doc("Active session information for the conference.")
  active_session?: ActiveSession;
}

@doc("List conferences response.")
model ListConferencesResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of conferences.")
  data?: ConferenceResponse[];
}
