/* Model is used to work-around a bug in the rest api plugin, not a TypeSpec issue. Duplicate description must be present and usage of a model is required.
Otherwise the property will render a additionalProperty with the exact same description as the top level property holding additionalProperties. */
@doc("An arbitrary JSON object available to store stateful application information in. Must be valid JSON and have a maximum size of 2,000 characters.")
@example(#{
  display_name: "Joe",
  an_array: #["foo", "bar", "baz"],
})
model PubSubState is Record<unknown>;

model NewPubSubToken {
  @minValue(1)
  @maxValue(43200)
  @example(15)
  @doc("The maximum time, in minutes, that the access token will be valid for. Between 1 and 43,200 (30 days).")
  ttl: integer;

  channels: PubSubChannels;

  @doc("The unique identifier of the member. Up to 250 characters. If not specified, a random UUID will be generated.")
  @example("John Doe")
  @maxLength(250)
  member_id?: string;

  /* Model is used to work-around a bug in the rest api plugin, not a TypeSpec issue. Duplicate description must be present and usage of a model is required.
    Otherwise the property will render a additionalProperty with the exact same description as the top level property holding additionalProperties. */
  @doc("An arbitrary JSON object available to store stateful application information in. Must be valid JSON and have a maximum size of 2,000 characters.")
  state?: PubSubState;
}

@doc("""
  Each channel with `write` and `read` objects with boolean as values. Max of 500 channels inside main `channels`. 
  Either `read`, `write`, or both are required inside each channel and default to false. 
  Each channel name can be up to 250 characters. Must be valid JSON.
  """)
@example(#{
  channela: #{ read: true, write: false },
  channelb: #{ read: true },
})
model PubSubChannels {
  ...PubSubPermissions;
}

@doc("PubSub Permissions for a channel.")
model PubSubPermissions
  is Record<{
    @doc("Gives the token read access to the channel.")
    @example(true)
    read?: boolean;

    @doc("Gives the token write access to the channel.")
    @example(false)
    write?: boolean;
  }>;