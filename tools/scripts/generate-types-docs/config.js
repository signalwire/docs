const config = {
  GITHUB_REPO: 'https://github.com/signalwire/signalwire-js',

  // TypeDoc kind constants
  KIND: {
    TYPE_ALIAS: 4194304,
    INTERFACE: 256,
    ENUM: 8,
    CLASS: 128,
    PROPERTY: 1024,
    METHOD: 2048,
    FUNCTION: 64,
    VARIABLE: 32,
  },

  // Types to exclude from documentation
  EXCLUDED_TYPES: ['unknown', 'any', 'void', 'never'],

  // Minimum description length to include
  MIN_DESCRIPTION_LENGTH: 3,
}

module.exports = { config }
