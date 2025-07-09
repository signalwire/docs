import "../../../types";

using TypeSpec.Http;

model CXMLScriptPathID {
  @doc("Unique ID of a cXML Script.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid
}

model CXMLScriptID {
  @doc("Unique ID of a cXML Script.")
  id: uuid
}

model CXMLScript {
  @doc("The cXML script contents")
  @example("<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Say>Hello World</Say></Response>")
  contents: string;

  @doc("Optional description of the cXML script")
  @example("Simple greeting script")
  description?: string;
}

model CXMLScriptWithID {
  ...CXMLScriptID,
  ...CXMLScript
}