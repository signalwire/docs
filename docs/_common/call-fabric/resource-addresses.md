Each **Resource** is uniquely identified by its **Address**, allowing for precise targeting and interaction within the Call Fabric ecosystem.
This simplifies the development process by providing a standardized way to handle different communication elements, and
enhances flexibility, as developers can interact with a wide range of communication tools using a unified approach.

:::info

Resources can have **multiple addresses**, and addresses are **mutable**.
For instance, you can map a SWML script and a Video Room to the same Resource Address.
These addresses can be changed or deleted later as needed.

:::

Each **Resource Address** has two components:

- **Context**: A identifier that indicates in which [context](#contexts) the resource is located.
- **Name**: The name is the unique identifier for the resource.

For example, the address for an `AI Agent` resource named `Alice-AI` in the `public` context would be `/public/Alice-AI`.


:::tip
If you are  interacting with a resource from within the same context, you can omit the context from the address.
For example, if you are interacting with a `Subscribers` resource named `Bob` from within the `private` context, 
you can use the address `/Bob` instead of `/private/Bob`.
:::

Once you have created a Resource, you can use the address to interact with it within the Call Fabric ecosystem.
Additionally, you can view the created resource in the `Resources` tab of the SignalWire Dashboard.
Here, you can view the address, type, and other details of the resource.

<figure>
  <img src={require("/docs/_common/call-fabric/created-resources.webp").default} alt="Picture showing the Resources Page on the SignalWire Dashboard. Two resources are created and shown in the list: 'Subscriber' and a `SWML Script'." />
  <figcaption>List of Resources</figcaption>
</figure>
