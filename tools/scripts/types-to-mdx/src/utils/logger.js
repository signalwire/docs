export class Logger {
  constructor() {
    this.verbose = false;
  }

  setVerbose(verbose) {
    this.verbose = verbose;
  }

  info(message) {
    console.log(message);
  }

  success(message) {
    console.log(message);
  }

  warn(message) {
    console.warn(message);
  }

  error(message, error = null) {
    console.error(message);
    if (error && this.verbose) {
      console.error(error);
    }
  }

  debug(message) {
    if (this.verbose) {
      console.log(`[DEBUG] ${message}`);
    }
  }

  trace(message, data = null) {
    if (this.verbose) {
      console.log(`[TRACE] ${message}`);
      if (data) {
        console.log(JSON.stringify(data, null, 2));
      }
    }
  }
}
