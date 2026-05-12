
namespace SWML.Messaging;
@summary("execute Method")
model Execute {
  @summary("execute")
  @doc("""
    Call a named section as a subroutine. Execution continues in the called section,
    then returns to the caller when the section completes. The destination must be
    the name of a section defined in the current document.
    """)
  execute: {
    @doc("Name of the section to execute. Must reference a section in the current document.")
    @example("greet")
    dest: string;

    @doc("Parameters accessible as `params.*` in the called section. Replaces (does not merge with) any outer `params` from the caller.")
    @example(#{ name: "%{message.from}" })
    params?: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
