const SWML_EXAMPLE = """
{ "version": "1.0.0", "sections": { "main": [{ "play": { "url": "https://cdn.signalwire.com/swml/audio.mp3" }}]}};
""";

const CXML_EXAMPLE = """
<?xml version="1.0" encoding="UTF-8"?><Response><Say>Hello World</Say></Response>
""";

const UTC_TIME_EXAMPLE = utcDateTime.fromISO(
    """
    2024-05-06T12:20:00Z
    """
);