namespace SWML.Calling;
@summary("denoise Method")
model Denoise {
  @doc("""
    Start noise reduction.
    For an inbound call that has not been answered and is not ending, the method attempts to answer it before starting noise reduction.
    You can stop it at any time using `stop_denoise`.
    """)
  @example(#{})
  denoise: {};
}
