import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/short_codes")
namespace SignalWireAPI.RelayRest.ShortCodes {
  @tag(SHORT_CODES_TAG)
  @friendlyName("Short Codes")
  interface ShortCodes {
    @operationId("list_short_codes")
    @summary("List short codes")
    @doc("""
      Lists the messaging Short Codes connected to your SignalWire project. These leased codes can send and receive high-volume messages through their configured handlers. Standard long-code phone numbers are available through [List phone numbers](/docs/apis/rest/phone-numbers/list-phone-numbers). Results are sorted by creation date, most recent first.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    list(...ListShortCodesQuery):
      | ShortCodeListResponse
      | StatusCode400
      | StatusCode401
      | StatusCode500;

    @operationId("retrieve_short_code")
    @summary("Get short code")
    @doc("""
      Retrieves one messaging Short Code connected to your SignalWire project. Use [List short codes](/docs/apis/rest/short-codes/list-short-codes) to find Short Codes, or [Get phone number](/docs/apis/rest/phone-numbers/retrieve-phone-number) for a standard long code.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    read(...ShortCodePathID):
      | ShortCodeResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;

    @operationId("update_short_code")
    @summary("Update short code")
    @doc("""
      Changes how a project Short Code is identified or routes inbound messages. It can route incoming traffic to a cXML webhook, cXML Application, or Relay handler. Standard project phone numbers use [Update phone number](/docs/apis/rest/phone-numbers/update-phone-number) instead.
      
      ${tokenPermissions<"_Numbers_">}
      """)
    @put
    update(...ShortCodePathID, @body body: UpdateShortCodeRequest):
      | ShortCodeResponse
      | StatusCode401
      | StatusCode404
      | ValidationError
      | StatusCode500;
  }
}
