import "../swml/calling";
import "../swml/messaging";

namespace SignalWireAPI;

@@example(SWML.Calling.SWMLObject,
  #{
    version: "1.0.0",
    sections: #{
      main: #[#{ play: #{ url: "https://cdn.signalwire.com/swml/audio.mp3" } }],
    },
  }
);

@@example(SWML.Messaging.SWMLObject,
  #{
    version: "1.0.0",
    sections: #{ main: #[#{ reply: "Thanks for your message!" }] },
  }
);

union SWMLDocument {
  calling: SWML.Calling.SWMLObject,
  messaging: SWML.Messaging.SWMLObject,
}
