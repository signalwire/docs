import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/phone_numbers")
namespace SpaceAPI.PhoneNumbers {
  @tag(PHONE_NUMBERS_TAG)
  @friendlyName("Phone Numbers")
  interface PhoneNumbers {
    @operationId("list_phone_numbers")
    @summary("List all Phone Numbers")
    @doc("""
      Returns a list of your Phone Numbers. The phone numbers are returned
      sorted by creation date, with the most recent phone numbers appearing
      first. The list is filterable by sending in any of the following
      parameters.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    list(
      @query
      @doc("The name given to the phone number. Will return all Phone Numbers containing this value as a substring.")
      filter_name?: string,

      @query
      @doc("The phone number in E164 format. Will return all Phone Numbers containing this value as a substring.")
      filter_number?: string
    ): PhoneNumberListResponse | StatusCode401 | StatusCode500;

    @operationId("purchase_phone_number")
    @summary("Purchase a Phone Number")
    @doc("""
      Purchases a phone number.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @post
    create(@body body: PurchasePhoneNumberRequest):
      | {
          @statusCode statusCode: 201;
          @body phone_number: PhoneNumberResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("get_phone_number")
    @summary("Retrieve a Phone Number")
    @doc("""
      Retrieves the details of a phone number.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    read(...PhoneNumberPathID): PhoneNumberResponse | StatusCode401 | StatusCode404 | StatusCode500;

    @operationId("update_phone_number")
    @summary("Update a Phone Number")
    @doc("""
      Updates a phone number.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @put
    update(...PhoneNumberPathID, @body body: UpdatePhoneNumberRequest):
      | {
          @statusCode statusCode: 200;
          @body phone_number: PhoneNumberResponse;
        }
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("release_phone_number")
    @summary("Release a Phone Number")
    @doc("""
      Releases a phone number.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @delete
    delete(...PhoneNumberPathID):
      | {
          @statusCode statusCode: 204;
        }
      | StatusCode401
      | StatusCode404
      | StatusCode500;

    @operationId("search_phone_numbers")
    @summary("Search Available Phone Numbers")
    @doc("""
      Searches for available phone numbers to purchase.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @route("/search")
    @get
    search(
      @query
      @doc("Filter by area code.")
      area_code?: string,

      @query
      @doc("Filter by country code.")
      country_code?: string,

      @query
      @doc("Filter by region.")
      region?: string,

      @query
      @doc("Filter by city.")
      city?: string,

      @query
      @doc("Filter by number type (local, toll_free).")
      number_type?: string
    ): AvailablePhoneNumbersResponse | StatusCode401 | StatusCode500;
  }
}

@route("/imported_phone_numbers")
namespace SpaceAPI.ImportedPhoneNumbers {
  @tag(IMPORTED_PHONE_NUMBERS_TAG)
  @friendlyName("Imported Phone Numbers")
  interface ImportedPhoneNumbers {
    @operationId("import_phone_number")
    @summary("Import a Phone Number")
    @doc("""
      Import a phone number hosted elsewhere into your SignalWire Space.

      **Note:** This is a **Partner API**. To enable it on your SignalWire Space, contact [Sales](https://signalwire.com/company/contact?utm_campaign=devex_sent_em).

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @post
    create(@body body: ImportPhoneNumberRequest):
      | {
          @statusCode statusCode: 201;
          @body phone_number: PhoneNumberResponse;
        }
      | StatusCode401
      | ValidationError
      | StatusCode500;
  }
}

@route("/lookup/phone_number")
namespace SpaceAPI.PhoneNumberLookup {
  @tag(PHONE_NUMBER_LOOKUP_TAG)
  @friendlyName("Phone Number Lookup")
  interface PhoneNumberLookup {
    @operationId("lookup_phone_number")
    @summary("Phone Number Lookup")
    @doc("""
      This endpoint allows you to look up validity and formatting
      information about a number. You can optionally lookup additional
      information about the number such as carrier and caller ID data.

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @route("/{e164_number}")
    @get
    lookup(
      ...E164NumberPath,

      @query
      @doc("Further number information to include in the response, some of which are billable. You can specify: carrier (Lookup full carrier information for the number), cnam (Lookup Caller ID information for the number). Separate multiple values with a comma: include=carrier,cnam.")
      include?: string
    ): PhoneNumberLookupResponse | StatusCode401 | StatusCode404 | StatusCode500;
  }
}
