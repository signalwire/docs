import "./reply";
import "./receive";
import "./request";
import "./execute";
import "./transfer";
import "./switch";
import "./goto";
import "./return";
import "./label";

@summary("SWML methods")
union SWMLMethod {
  Reply,
  Receive,
  Request,
  Execute,
  Transfer,
  Switch,
  Goto,
  Return,
  Label,
}
