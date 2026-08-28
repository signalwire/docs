import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "../../types";
import "../tags.tsp";
import "../../../_shared/alias/token-permissions.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/mfa")
namespace SignalWireAPI.RelayRest.Mfa {
  @tag(MFA_TAG)
  @friendlyName("Multi-Factor Authentication")
  interface Mfa {
    @operationId("request_mfa_sms")
    @summary("Request MFA token via SMS")
    @doc("""
      Creates a multi-factor authentication request and sends its code to the destination by SMS. Use it when an application must verify possession of a text-capable phone number; save the returned request ID and submit the code to [Verify MFA token](/docs/apis/rest/multi-factor-authentication/verify-mfa-token). Use the voice-call operation when the recipient cannot receive SMS.
      
      ${tokenPermissions<"_Management_">}
      """)
    @route("/sms")
    @post
    sendSms(@body body: MfaRequest):
      | MfaResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("request_mfa_call")
    @summary("Request MFA token via call")
    @doc("""
      Creates a multi-factor authentication request and delivers its code in a voice call. Use it when the destination cannot receive SMS or voice delivery is preferred; save the returned request ID and submit the code to [Verify MFA token](/docs/apis/rest/multi-factor-authentication/verify-mfa-token). Use the SMS operation for text delivery.
      
      ${tokenPermissions<"_Management_">}
      """)
    @route("/call")
    @post
    sendCall(@body body: MfaRequest):
      | MfaResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;

    @operationId("verify_mfa_token")
    @summary("Verify MFA token")
    @doc("""
      Checks a submitted code against the multi-factor authentication request identified in the path. Use it after requesting delivery by SMS or voice call and before granting the user access. The request's configured lifetime and attempt limit determine whether further verification is allowed.
      
      ${tokenPermissions<"_Management_">}
      """)
    @route("/{mfa_request_id}/verify")
    @post
    verify(...MfaRequestIdPath, @body body: MfaVerifyRequest):
      | MfaVerifyResponse
      | StatusCode401
      | ValidationError
      | StatusCode500;
  }
}
