// Shapes of the assets produced by the Python pipeline (tools/voice_widget). These two files +
// the audio/ tree are the entire contract handed to devex — keep this in sync with
// catalog_schema.json and synth_examples.py.

export type Gender = "male" | "female" | "neutral" | "unknown";

export interface CatalogVoice {
  key: string;              // "<engine>/<voice_id>" — unique
  engine: string;           // mod_openai engine id (elevenlabs, cartesia, ...)
  provider: string;         // human-facing label
  voice_id: string;         // value passed to the provider to synthesize
  display_name: string;     // mod_openai `voice` field / UI label
  languages: string[];
  primary_language: string;
  gender: Gender;
  model: string | null;
  tags: string[];
  description: string;
  provider_preview_url: string | null;
  source: "api" | "static" | "docs";
  fetched_at: string;
}

export interface Catalog {
  generated_at: string;
  voices: CatalogVoice[];
}

export interface Clip {
  language: string;
  sample_text: string;
  audio: string;            // path relative to the audio base (e.g. "audio/elevenlabs/Brian.mp3")
  format: string;
  bytes: number;
  duration_sec: number | null;
  synth_model: string | null;
  fingerprint: string | null;
  synthesized_at: string;
  status: "ok" | "error";
  error: string | null;
}

export interface Manifest {
  generated_at: string;
  clips: Record<string, Clip>; // keyed by CatalogVoice.key
}

// A catalog voice joined with its synthesized clip (if any).
export interface VoiceRow extends CatalogVoice {
  clip?: Clip;
}
