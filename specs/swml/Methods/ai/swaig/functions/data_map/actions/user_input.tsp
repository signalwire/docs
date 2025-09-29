@summary("UserInputAction object")
model UserInputAction {
  @summary("user_input")
  @doc("Used to inject text into the users queue as if they input the data themselves.")
  user_input: string;
}
