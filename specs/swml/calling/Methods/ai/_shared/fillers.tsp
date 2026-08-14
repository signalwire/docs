import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@doc("""
  Filler phrases keyed by language code, one array per language. A single phrase is
  picked from the matching array at random.

  The agent looks for an entry matching the language being spoken, then `auto`, then
  `default`, and plays nothing when none of the three is set. Any code the speech
  recognition engine reports works as a key — the codes listed here are the common set
  for the default engine, not a closed list.
  """)
model FunctionFillers {
  @doc("Played when no entry matches the language being spoken and no `auto` entry is set.")
  @example(#["one moment please", "let me check"])
  default?: string[];

  @doc("""
    Phrases to translate into whichever language is being spoken, used when no entry
    matches that language. Takes precedence over `default`.
    """)
  @example(#["one moment please", "let me check"])
  auto?: string[];

  @doc("Bulgarian")
  @example(#["един момент", "нека проверя"])
  bg?: string[];

  @doc("Catalan")
  @example(#["un moment", "deixa'm comprovar"])
  ca?: string[];

  @doc("Chinese (Simplified)")
  @example(#["请稍等", "让我查一下"])
  zh?: string[];

  @doc("Chinese (Simplified, China)")
  @example(#["请稍等", "让我查一下"])
  `zh-CN`?: string[];

  @doc("Chinese (Simplified Han)")
  @example(#["请稍等", "让我查一下"])
  `zh-Hans`?: string[];

  @doc("Chinese (Traditional, Taiwan)")
  @example(#["請稍等", "讓我查一下"])
  `zh-TW`?: string[];

  @doc("Chinese (Traditional Han)")
  @example(#["請稍等", "讓我查一下"])
  `zh-Hant`?: string[];

  @doc("Chinese (Traditional, Hong Kong)")
  @example(#["請稍等", "讓我查一下"])
  `zh-HK`?: string[];

  @doc("Czech")
  @example(#["moment prosím", "nechte mě zkontrolovat"])
  cs?: string[];

  @doc("Danish")
  @example(#["et øjeblik", "lad mig tjekke"])
  da?: string[];

  @doc("Danish (Denmark)")
  @example(#["et øjeblik", "lad mig tjekke"])
  `da-DK`?: string[];

  @doc("Dutch")
  @example(#["een moment", "laat me even kijken"])
  nl?: string[];

  @doc("English")
  @example(#["one moment please", "let me check"])
  en?: string[];

  @doc("English (United States)")
  @example(#["one moment please", "let me check"])
  `en-US`?: string[];

  @doc("English (United Kingdom)")
  @example(#["one moment please", "let me check"])
  `en-GB`?: string[];

  @doc("English (New Zealand)")
  @example(#["one moment please", "let me check"])
  `en-NZ`?: string[];

  @doc("English (India)")
  @example(#["one moment please", "let me check"])
  `en-IN`?: string[];

  @doc("English (Australia)")
  @example(#["one moment please", "let me check"])
  `en-AU`?: string[];

  @doc("Estonian")
  @example(#["üks hetk", "las ma kontrollin"])
  et?: string[];

  @doc("Finnish")
  @example(#["hetkinen", "annas kun tarkistan"])
  fi?: string[];

  @doc("Flemish (Belgian Dutch)")
  @example(#["een moment", "laat me even kijken"])
  `nl-BE`?: string[];

  @doc("French")
  @example(#["un instant", "laissez-moi vérifier"])
  fr?: string[];

  @doc("French (Canada)")
  @example(#["un instant", "laissez-moi vérifier"])
  `fr-CA`?: string[];

  @doc("German")
  @example(#["einen Moment bitte", "lassen Sie mich nachsehen"])
  de?: string[];

  @doc("German (Switzerland)")
  @example(#["einen Moment bitte", "lassen Sie mich nachsehen"])
  `de-CH`?: string[];

  @doc("Greek")
  @example(#["μια στιγμή", "επιτρέψτε μου να ελέγξω"])
  el?: string[];

  @doc("Hindi")
  @example(#["एक पल रुकिए", "मुझे जांचने दीजिए"])
  hi?: string[];

  @doc("Hungarian")
  @example(#["egy pillanat", "hadd ellenőrizzem"])
  hu?: string[];

  @doc("Indonesian")
  @example(#["sebentar", "biar saya periksa"])
  id?: string[];

  @doc("Italian")
  @example(#["un momento", "lasciami controllare"])
  it?: string[];

  @doc("Japanese")
  @example(#["少々お待ちください", "確認いたします"])
  ja?: string[];

  @doc("Korean")
  @example(#["잠시만요", "확인해 보겠습니다"])
  ko?: string[];

  @doc("Korean (South Korea)")
  @example(#["잠시만요", "확인해 보겠습니다"])
  `ko-KR`?: string[];

  @doc("Latvian")
  @example(#["vienu brīdi", "ļaujiet man pārbaudīt"])
  lv?: string[];

  @doc("Lithuanian")
  @example(#["vieną akimirką", "leiskite patikrinti"])
  lt?: string[];

  @doc("Malay")
  @example(#["sebentar", "biar saya semak"])
  ms?: string[];

  @doc("Used when the agent's language code is set to `multi`, which lets the speech recognition engine transcribe whichever of its supported languages the caller speaks.")
  @example(#["one moment", "un momento"])
  multi?: string[];

  @doc("Norwegian")
  @example(#["et øyeblikk", "la meg sjekke"])
  no?: string[];

  @doc("Polish")
  @example(#["chwileczkę", "pozwól mi sprawdzić"])
  pl?: string[];

  @doc("Portuguese")
  @example(#["um momento", "deixe-me verificar"])
  pt?: string[];

  @doc("Portuguese (Brazil)")
  @example(#["um momento", "deixa eu verificar"])
  `pt-BR`?: string[];

  @doc("Portuguese (Portugal)")
  @example(#["um momento", "deixe-me verificar"])
  `pt-PT`?: string[];

  @doc("Romanian")
  @example(#["un moment", "să verific"])
  ro?: string[];

  @doc("Russian")
  @example(#["одну минуту", "позвольте проверить"])
  ru?: string[];

  @doc("Slovak")
  @example(#["moment prosím", "dovoľte mi skontrolovať"])
  sk?: string[];

  @doc("Spanish")
  @example(#["un momento", "déjame verificar"])
  es?: string[];

  @doc("Spanish (Latin America)")
  @example(#["un momento", "déjame verificar"])
  `es-419`?: string[];

  @doc("Swedish")
  @example(#["ett ögonblick", "låt mig kolla"])
  sv?: string[];

  @doc("Swedish (Sweden)")
  @example(#["ett ögonblick", "låt mig kolla"])
  `sv-SE`?: string[];

  @doc("Thai")
  @example(#["สักครู่", "ให้ผมตรวจสอบ"])
  th?: string[];

  @doc("Thai (Thailand)")
  @example(#["สักครู่", "ให้ผมตรวจสอบ"])
  `th-TH`?: string[];

  @doc("Turkish")
  @example(#["bir dakika", "kontrol edeyim"])
  tr?: string[];

  @doc("Ukrainian")
  @example(#["одну хвилину", "дозвольте перевірити"])
  uk?: string[];

  @doc("Vietnamese")
  @example(#["xin chờ một chút", "để tôi kiểm tra"])
  vi?: string[];

  // Open by design: under `ai.multilingual` the key is whatever the ASR engine reports,
  // and the engine matches keys by string compare against nothing but the current
  // language. The named properties above carry the docs; this keeps unlisted codes valid.
  ...TypeSpec.Record<string[]>;
}
