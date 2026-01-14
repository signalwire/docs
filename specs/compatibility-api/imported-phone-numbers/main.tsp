import "@typespec/http";
import "@typespec/openapi";
import "./models/requests.tsp";
import "../incoming-phone-numbers/models/core.tsp";
import "../_shared/errors.tsp";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@route("/Accounts/{AccountSid}/ImportedPhoneNumbers")
namespace CompatibilityAPI.ImportedPhoneNumbers {
  @tag(IMPORTED_PHONE_NUMBERS_TAG)
  @friendlyName("Imported Phone Numbers")
  interface ImportedPhoneNumbers {
    @operationId("create_imported_phone_number")
    @summary("Import a Phone Number")
    @doc("""
      Import a phone number hosted elsewhere into your SignalWire Space.

      **Note:** This is a **Partner API**. To enable it on your SignalWire Space, contact 
      [Sales](https://signalwire.com/company/contact?utm_campaign=devex_sent_em).

      #### Permissions
      The API token must include the following scopes: _Numbers_.
      """)
    @post
    create(...ImportedPhoneNumbersAccountSidPath, @body body: ImportPhoneNumberRequest): {
      @statusCode statusCode: 201;
      @body body: IncomingPhoneNumber;
    } | StatusCode401 | StatusCode400 | StatusCode422;
  }
}
