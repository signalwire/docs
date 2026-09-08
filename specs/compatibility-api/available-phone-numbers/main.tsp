import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";
import "../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/AvailablePhoneNumbers")
namespace CompatibilityAPI.AvailablePhoneNumbers {
  @tag(AVAILABLE_PHONE_NUMBERS_TAG)
  @friendlyName("Available Phone Numbers")
  interface AvailablePhoneNumbers {
    @operationId("list_available_phone_number_resources")
    @summary("List of AvailablePhoneNumber resources")
    @doc("""
      Returns the resource directories for searching available numbers, grouped by ISO country and number type such as Local or Toll-Free. This operation lists search routes rather than purchasable numbers; use a country-specific search below or SignalWire REST [Search phone numbers](/docs/apis/rest/phone-numbers/search-available-phone-numbers) to query inventory.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    list(
      ...AvailablePhoneNumbersAccountSidPath,
    ): AvailablePhoneNumberResourcesResponse | CompatibilityStatusCode400 | CompatibilityStatusCode401;

    @operationId("list_available_phone_number_resources_by_country")
    @summary("List of AvailablePhoneNumber resources by country")
    @doc("""
      Returns the available-number search directories for one ISO country, grouped by number type such as Local or Toll-Free. This operation describes search routes; use [Search local available phone numbers](/docs/compatibility-api/rest/available-phone-numbers/search-local-available-phone-numbers) or the toll-free search to return actual inventory.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{IsoCountry}")
    listByCountry(
      ...AvailablePhoneNumbersAccountSidPath,
      ...IsoCountryPath,
    ): AvailablePhoneNumberByCountryResponse | CompatibilityStatusCode400 | CompatibilityStatusCode401;

    @operationId("search_local_available_phone_numbers")
    @summary("Search for available phone numbers that match your criteria.")
    @doc("""
      Searches SignalWire inventory for local phone numbers available in one ISO country. Results are candidates, not project resources, until purchased through Incoming Phone Numbers or the native purchase operation. Use the [toll-free search](/docs/compatibility-api/rest/available-phone-numbers/search-toll-free-available-phone-numbers) for toll-free inventory, or native [Search phone numbers](/docs/apis/rest/phone-numbers/search-available-phone-numbers) for the JSON API.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{IsoCountry}/Local")
    searchLocal(
      ...AvailablePhoneNumbersAccountSidPath,
      ...IsoCountryPath,

      @query
      @doc("Find numbers in the provided area code. Only available for numbers in US and Canada.")
      @example("213")
      AreaCode?: string,

      @query
      @doc("New numbers on SignalWire are marked as `beta`.")
      @example(false)
      Beta?: boolean,

      @query
      @doc("Find numbers based off of a pattern. Valid characters are `[0-9a-zA-Z]`.")
      @example("555")
      Contains?: string,

      @query
      @doc("Accepted but has no effect on the response.")
      @example(false)
      ExcludeAllAddressRequired?: boolean,

      @query
      @doc("Accepted but has no effect on the response.")
      @example(false)
      ExcludeForeignAddressRequired?: boolean,

      @query
      @doc("Accepted but has no effect on the response.")
      @example(false)
      ExcludeLocalAddressRequired?: boolean,

      @query
      @doc("Accepted but not supported; has no effect on the response.")
      @example(true)
      FaxEnabled?: boolean,

      @query
      @doc("Limits search to a city/locality. Requires InRegion to also be set.")
      @example("Seattle")
      InLocality?: string,

      @query
      @doc("Limits search to same region as number. Must be a two-letter state/province code.")
      @example("WA")
      InRegion?: string,

      @query
      @doc("Accepted but not supported; has no effect on the response.")
      @example(true)
      MmsEnabled?: boolean,

      @query
      @doc("Accepted but not supported; has no effect on the response.")
      @example(true)
      SmsEnabled?: boolean,

      @query
      @doc("Accepted but not supported; has no effect on the response.")
      @example(true)
      VoiceEnabled?: boolean,
    ):
      | AvailablePhoneNumberListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;

    @operationId("search_toll_free_available_phone_numbers")
    @summary("Find toll-free numbers")
    @doc("""
      Searches SignalWire inventory for toll-free phone numbers available in one ISO country. Results are candidates, not project resources, until purchased through Incoming Phone Numbers or the native purchase operation. Use the [local search](/docs/compatibility-api/rest/available-phone-numbers/search-local-available-phone-numbers) for local inventory, or native [Search phone numbers](/docs/apis/rest/phone-numbers/search-available-phone-numbers) for the JSON API.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @route("/{IsoCountry}/TollFree")
    searchTollFree(
      ...AvailablePhoneNumbersAccountSidPath,
      ...IsoCountryPath,

      @query
      @doc("Find numbers in the provided area code. Only available for numbers in US and Canada.")
      @example("213")
      AreaCode?: string,

      @query
      @doc("New numbers on SignalWire are marked as `beta`.")
      @example(false)
      Beta?: boolean,

      @query
      @doc("Find numbers based off of a pattern. Valid characters are `[0-9a-zA-Z]`.")
      @example("555")
      Contains?: string,

      @query
      @doc("Accepted but has no effect on the response.")
      @example(false)
      ExcludeAllAddressRequired?: boolean,

      @query
      @doc("Accepted but has no effect on the response.")
      @example(false)
      ExcludeForeignAddressRequired?: boolean,

      @query
      @doc("Accepted but has no effect on the response.")
      @example(false)
      ExcludeLocalAddressRequired?: boolean,

      @query
      @doc("Accepted but not supported; has no effect on the response.")
      @example(true)
      FaxEnabled?: boolean,

      @query
      @doc("Limits search to a city/locality. Requires InRegion to also be set.")
      @example("Seattle")
      InLocality?: string,

      @query
      @doc("Limits search to same region as number. Must be a two-letter state/province code.")
      @example("WA")
      InRegion?: string,

      @query
      @doc("Accepted but not supported; has no effect on the response.")
      @example(true)
      MmsEnabled?: boolean,

      @query
      @doc("Accepted but not supported; has no effect on the response.")
      @example(true)
      SmsEnabled?: boolean,

      @query
      @doc("Accepted but not supported; has no effect on the response.")
      @example(true)
      VoiceEnabled?: boolean,
    ):
      | AvailablePhoneNumberListResponse
      | CompatibilityStatusCode400
      | CompatibilityStatusCode401
      | CompatibilityStatusCode422;
  }
}
