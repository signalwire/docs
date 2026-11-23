
namespace SWML.Calling;
@summary("user_input Action")
model UserInputAction {
  @summary("user_input")
  @doc("Adds text to the conversation as the caller's turn, as if the caller had said it, and the agent answers it. Works on realtime models too.")
  @example("I would like to speak to a manager")
  user_input: string;
}
