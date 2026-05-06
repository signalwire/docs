import "./answer";
import "./denoise";
import "./cond";
import "./connect";
import "./execute";
import "./enter_queue";
import "./switch";
import "./goto";
import "./label";
import "./hangup";
import "./join_room";
import "./join_conference";
import "./play";
import "./prompt";
import "./receive_fax";
import "./record";
import "./record_call";
import "./request";
import "./return";
import "./send_digits";
import "./send_fax";
import "./send_sms";
import "./set";
import "./sip_refer";
import "./stop_denoise";
import "./stop_record_call";
import "./stop_tap";
import "./tap";
import "./transfer";
import "./unset";
import "./sleep";
import "./live_transcribe";
import "./live_translate";
import "./ai";
import "./pay";
import "./detect_machine";
import "./user_event";
import "./amazon_bedrock";

@summary("SWML calling methods")
union CallingMethods {
  Answer,
  AI,
  AmazonBedrock,
  Cond,
  Connect,
  Denoise,
  EnterQueue,
  VoiceExecute,
  VoiceGoto,
  Label,
  LiveTranscribe,
  LiveTranslate,
  Hangup,
  JoinRoom,
  JoinConference,
  Play,
  Prompt,
  ReceiveFax,
  global.Record,
  RecordCall,
  VoiceRequest,
  VoiceReturn,
  SendDigits,
  SendFax,
  SendSMS,
  Set,
  Sleep,
  SIPRefer,
  StopDenoise,
  StopRecordCall,
  StopTap,
  VoiceSwitch,
  Tap,
  VoiceTransfer,
  Unset,
  Pay,
  DetectMachine,
  UserEvent,
}
