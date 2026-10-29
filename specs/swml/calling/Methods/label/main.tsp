namespace SWML.Calling;
@summary("label Method")
model Label {
  @doc("""
    Mark any point of the SWML section with a label so that goto can jump to it.
    The label name must be a nonempty string, and label names must be unique within the section.
    """)
  @example("greeting")
  @minLength(1)
  label: string;
}
