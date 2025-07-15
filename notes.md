# Below are notes i tracked while auditing the specs.

The endpoin ts will be organized by the `tag` they are set to.


## AI Agents: Custom


1. in file: specs\signalwire-rest\fabric-api\ai-agent\models\responses.tsp - what are the possible values for `type`?

## Call Flows

1. I getting 404s when attempting to list call flow versions and addresses. Not sure if im using invalid ID or if path is incorrect

2. In file: specs\signalwire-rest\fabric-api\call-flows\models\responses.tsp - can `type` be hard set to `call_flow` instead of `string`?


## Conference Rooms

1. In file: specs\signalwire-rest\fabric-api\conference-rooms\models\responses.tsp - can `type` be hard set to `video_room` instead of `string`?

## cXML Scripts

1. In file: specs\signalwire-rest\fabric-api\cxml-webhooks\models\responses.tsp - can `type` be hard set to `laml_bin` or `cxml_script` instead of `string`?

## cXML Webhooks

1. In file: specs\signalwire-rest\fabric-api\conference-rooms\models\responses.tsp - can `type` be hard set to `laml_webhook` or `cxml_webhook` instead of `string`?

## Dialogflow Agens

1. In file: specs\signalwire-rest\fabric-api\dialogflow-agents\models\responses.tsp - can `type` be hard set to `dialogflow_agent` instead of `string`?

## FreeSwitch Connector

1. In file: specs\signalwire-rest\fabric-api\freeswitch-connectors\models\responses.tsp - can `type` be hard set to `freeswitch_connector` instead of `string`?


## cXML Applications

1. In file: specs\signalwire-rest\fabric-api\freeswitch-connectors\models\responses.tsp - can `type` be hard set to `cxml_application` instead of `string`?


## cXML Scripts

1. In cXML Response, what are the valid `script_type` values (`calling` & `messagiong`?) 

## Resources

1. Couldnt get a ID to work with assinging a resource to a SIP endpoint
2. Should `type` be `room`?


## SIP Endpoints

1. A lot of the `list` response propterties seem to be either conditional or dont actually exist.
2. Default request body doesnt work due to call_handler supposedly not being a real property. Intentional?
3. Can we split this into multiple request body objects, for the different resource types? (Create/Update)


## Domain Applications

1. What is the response `type`?



# Personal Note

Go back to categories:

1. SIP Endpoints


2. Resources (All of it)


3. SubScribers (and all of its tokens)
