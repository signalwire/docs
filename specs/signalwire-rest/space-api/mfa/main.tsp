import "@typespec/http";
import "@typespec/openapi";
import "./models/core.tsp";
import "../../types";
import "../tags.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Types.StatusCodes;

@route("/mfa")
namespace SpaceAPI.Mfa {
  @tag(MFA_TAG)
  @friendlyName("Multi-Factor Authentication")
  interface Mfa {
    @operationId("send_mfa_sms")
    @summary("Send MFA Code via SMS")
    @doc("""
      Sends a multi-factor authentication code via SMS.

      #### Permissions
      The API token must include the following scopes: _Messaging_.
      """)
    @route("/sms")
    @post
    sendSms(@body body: MfaRequest): MfaResponse | StatusCode401 | ValidationError | StatusCode500;

    @operationId("send_mfa_call")
    @summary("Send MFA Code via Voice Call")
    @doc("""
      Sends a multi-factor authentication code via voice call.

      #### Permissions
      The API token must include the following scopes: _Voice_.
      """)
    @route("/call")
    @post
    sendCall(@body body: MfaRequest): MfaResponse | StatusCode401 | ValidationError | StatusCode500;

    @operationId("verify_mfa")
    @summary("Verify MFA Code")
    @doc("""
      Verifies a multi-factor authentication code.

      #### Permissions
      The API token must include the following scopes: _Messaging_ or _Voice_.
      """)
    @route("/verify")
    @post
    verify(@body body: MfaVerifyRequest): MfaVerifyResponse | StatusCode401 | ValidationError | StatusCode500;
  }
}
