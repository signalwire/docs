/* Model is used to work-around a bug in the rest api plugin, not a TypeSpec issue. Duplicate description must be present and usage of a model is required.
Otherwise the property will render a additionalProperty with the exact same description as the top level property holding additionalProperties. */
@doc("An arbitrary JSON object available to store stateful application information in. Must be valid JSON and have a maximum size of 2,000 characters.")
@example(#{key: "value", key2: "value2"})
model ChatState is Record<unknown>;

model NewChatToken {
    @minValue(1)
    @maxValue(43200)
    @example(60)
    @doc("The maximum time, in minutes, that the access token will be valid for. Between 1 and 43,200 (30 days).")
    ttl: integer;


    channels: ChatChannel;

    @doc("The unique identifier of the member. Up to 250 characters. If not specified, a random UUID will be generated.")
    @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
    member_id?: string;

    /* Model is used to work-around a bug in the rest api plugin, not a TypeSpec issue. Duplicate description must be present and usage of a model is required.
    Otherwise the property will render a additionalProperty with the exact same description as the top level property holding additionalProperties. */
    @doc("An arbitrary JSON object available to store stateful application information in. Must be valid JSON and have a maximum size of 2,000 characters.")
    state?: ChatState;

}


@doc("""
User-defined channel names. Each channel is a object with `read` and `write` properties.
Max of 500 channels inside main `channels`. Either `read`, `write`, or both are required inside each channel and default to `false`.
Each channel name can be up to 250 characters. Must be valid JSON.
""")
@example(#{channel1: #{read: true, write: true}, channel2: #{read: true, write: false}})
model ChatChannel  {
    ...ChatPermissions;
};

@doc("Chat Permissions for a channel.")
model ChatPermissions is Record<{

    @doc("Gives the token read access to the channel.")
    @example(true)
    read: boolean;
    @doc("Gives the token write access to the channel.")
    @example(false)
    write: boolean;
}>;