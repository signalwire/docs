
namespace SWML.Messaging;
@summary("label Method")
model Label {
  @doc("""
    Mark any point of the SWML section with a label so that `goto` can jump to it. Must be
    unique within the section.
    """)
  @example("greeting")
  label: string;
}
