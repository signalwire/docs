import "./Calling";
import "./Messaging";
import "@typespec/json-schema";


using TypeSpec.JsonSchema;

@summary("SWML methods")
@oneOf
union SWMLMethod {
  CallingMethods,
  MessagingMethods,
}
