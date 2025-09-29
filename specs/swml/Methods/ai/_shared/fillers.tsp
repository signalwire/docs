import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@doc("Supported language codes")
@oneOf
union FunctionFillers {
  {
    @doc("Default language set by the user")
    default: string[],
  },
  {
    @doc("Bulgarian")
    bg: string[],
  },
  {
    @doc("Catalan")
    ca: string[],
  },
  {
    @doc("Chinese (Simplified)")
    zh: string[],
  },
  {
    @doc("Chinese (Simplified, China)")
    `zh-CN`: string[],
  },
  {
    @doc("Chinese (Simplified Han)")
    `zh-Hans`: string[],
  },
  {
    @doc("Chinese (Traditional, Taiwan)")
    `zh-TW`: string[],
  },
  {
    @doc("Chinese (Traditional Han)")
    `zh-Hant`: string[],
  },
  {
    @doc("Chinese (Traditional, Hong Kong)")
    `zh-HK`: string[],
  },
  {
    @doc("Czech")
    cs: string[],
  },
  {
    @doc("Danish")
    da: string[],
  },
  {
    @doc("Danish (Denmark)")
    `da-DK`: string[],
  },
  {
    @doc("Dutch")
    nl: string[],
  },
  {
    @doc("English")
    en: string[],
  },
  {
    @doc("English (United States)")
    `en-US`: string[],
  },
  {
    @doc("English (United Kingdom)")
    `en-GB`: string[],
  },
  {
    @doc("English (New Zealand)")
    `en-NZ`: string[],
  },
  {
    @doc("English (India)")
    `en-IN`: string[],
  },
  {
    @doc("English (Australia)")
    `en-AU`: string[],
  },
  {
    @doc("Estonian")
    et: string[],
  },
  {
    @doc("Finnish")
    fi: string[],
  },
  {
    @doc("Flemish (Belgian Dutch)")
    `nl-BE`: string[],
  },
  {
    @doc("French")
    fr: string[],
  },
  {
    @doc("French (Canada)")
    `fr-CA`: string[],
  },
  {
    @doc("German")
    de: string[],
  },
  {
    @doc("German (Switzerland)")
    `de-CH`: string[],
  },
  {
    @doc("Greek")
    el: string[],
  },
  {
    @doc("Hindi")
    hi: string[],
  },
  {
    @doc("Hungarian")
    hu: string[],
  },
  {
    @doc("Indonesian")
    id: string[],
  },
  {
    @doc("Italian")
    it: string[],
  },
  {
    @doc("Japanese")
    ja: string[],
  },
  {
    @doc("Korean")
    ko: string[],
  },
  {
    @doc("Korean (South Korea)")
    `ko-KR`: string[],
  },
  {
    @doc("Latvian")
    lv: string[],
  },
  {
    @doc("Lithuanian")
    lt: string[],
  },
  {
    @doc("Malay")
    ms: string[],
  },
  {
    @doc("Multilingual (Spanish + English)")
    multi: string[],
  },
  {
    @doc("Norwegian")
    no: string[],
  },
  {
    @doc("Polish")
    pl: string[],
  },
  {
    @doc("Portuguese")
    pt: string[],
  },
  {
    @doc("Portuguese (Brazil)")
    `pt-BR`: string[],
  },
  {
    @doc("Portuguese (Portugal)")
    `pt-PT`: string[],
  },
  {
    @doc("Romanian")
    ro: string[],
  },
  {
    @doc("Russian")
    ru: string[],
  },
  {
    @doc("Slovak")
    sk: string[],
  },
  {
    @doc("Spanish")
    es: string[],
  },
  {
    @doc("Spanish (Latin America)")
    `es-419`: string[],
  },
  {
    @doc("Swedish")
    sv: string[],
  },
  {
    @doc("Swedish (Sweden)")
    `sv-SE`: string[],
  },
  {
    @doc("Thai")
    th: string[],
  },
  {
    @doc("Thai (Thailand)")
    `th-TH`: string[],
  },
  {
    @doc("Turkish")
    tr: string[],
  },
  {
    @doc("Ukrainian")
    uk: string[],
  },
  {
    @doc("Vietnamese")
    vi: string[],
  },
}
