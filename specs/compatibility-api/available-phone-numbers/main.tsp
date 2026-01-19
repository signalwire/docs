import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/responses.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

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
      Returns a list of URIs to phone number resources available to the account, categorized by type (Local, Toll-Free, Mobile, etc) and ISO country.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    list(...AvailablePhoneNumbersAccountSidPath): AvailablePhoneNumberResourcesResponse | CompatibilityStatusCode401;

    @operationId("list_available_phone_number_resources_by_country")
    @summary("List of AvailablePhoneNumber resources by country")
    @doc("""
      Returns a list of URIs to phone number resources available to the account in the specified ISO country, categorized by type (Local, Toll-Free, Mobile, etc).

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @route("/{IsoCountry}")
    listByCountry(...AvailablePhoneNumbersAccountSidPath, ...IsoCountryPath): AvailablePhoneNumberByCountryResponse | CompatibilityStatusCode401;

    @operationId("search_local_available_phone_numbers")
    @summary("Search for available phone numbers that match your criteria.")
    @doc("""
      Search for Local AvailablePhoneNumbers.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
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
      @doc("Whether or not to exclude numbers that require an address anywhere in the world.")
      @example(false)
      ExcludeAllAddressRequired?: boolean,

      @query
      @doc("Whether or not to exclude numbers that require a foreign address.")
      @example(false)
      ExcludeForeignAddressRequired?: boolean,

      @query
      @doc("Whether or not to exclude numbers that require a local address.")
      @example(false)
      ExcludeLocalAddressRequired?: boolean,

      @query
      @doc("Whether or not a number can receive faxes.")
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
      @doc("Whether or not a number can receive MMS messages.")
      @example(true)
      MmsEnabled?: boolean,

      @query
      @doc("Whether or not a number can receive SMS messages.")
      @example(true)
      SmsEnabled?: boolean,

      @query
      @doc("Whether or not a number can receive calls.")
      @example(true)
      VoiceEnabled?: boolean,
    ): AvailablePhoneNumberListResponse | CompatibilityStatusCode401;

    @operationId("search_toll_free_available_phone_numbers")
    @summary("Find toll-free numbers.")
    @doc("""
      Search for toll-free AvailablePhoneNumbers.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
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
      @doc("Whether or not to exclude numbers that require an address anywhere in the world.")
      @example(false)
      ExcludeAllAddressRequired?: boolean,

      @query
      @doc("Whether or not to exclude numbers that require a foreign address.")
      @example(false)
      ExcludeForeignAddressRequired?: boolean,

      @query
      @doc("Whether or not to exclude numbers that require a local address.")
      @example(false)
      ExcludeLocalAddressRequired?: boolean,

      @query
      @doc("Whether or not a number can receive faxes.")
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
      @doc("Whether or not a number can receive MMS messages.")
      @example(true)
      MmsEnabled?: boolean,

      @query
      @doc("Whether or not a number can receive SMS messages.")
      @example(true)
      SmsEnabled?: boolean,

      @query
      @doc("Whether or not a number can receive calls.")
      @example(true)
      VoiceEnabled?: boolean,
    ): AvailablePhoneNumberListResponse | CompatibilityStatusCode401;
  }
}
