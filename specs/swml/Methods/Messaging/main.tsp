import "./reply";
import "./receive";
import "./request";
import "./execute";
import "./transfer";
import "./switch";
import "./goto";
import "./return";

@summary("SWML messaging methods")
union MessagingMethods {
  Reply,
  Receive,
  MessagingRequest,
  MessagingExecute,
  MessagingTransfer,
  MessagingSwitch,
  MessagingGoto,
  MessagingReturn,
  Label,
}
