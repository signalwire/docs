import { readFileSync } from "fs";
import { Application, ProjectReflection, Deserializer } from "typedoc";
import axios from "axios";

export class TypeDocLoader {
  constructor(logger) {
    this.logger = logger;
  }

  async load(input) {
    this.logger.debug(`Loading TypeDoc data from: ${input}`);

    let jsonData;

    try {
      if (input.startsWith("http://") || input.startsWith("https://")) {
        this.logger.debug("Fetching data from URL...");
        jsonData = await this.loadFromUrl(input);
      } else {
        this.logger.debug("Reading data from file...");
        jsonData = await this.loadFromFile(input);
      }

      this.logger.debug("Deserializing TypeDoc JSON...");
      const projectReflection = await this.deserialize(jsonData);

      this.logger.debug(
        `Successfully loaded project: ${projectReflection.name || "Unnamed"}`,
      );
      return projectReflection;
    } catch (error) {
      this.logger.error("Failed to load TypeDoc data", error);
      throw new Error(`Failed to load TypeDoc data: ${error.message}`);
    }
  }

  async loadFromUrl(url) {
    try {
      const response = await axios.get(url, {
        timeout: 30000,
        maxContentLength: 50 * 1024 * 1024, // 50MB max
      });

      if (typeof response.data !== "object") {
        throw new Error("Invalid JSON response from URL");
      }

      return response.data;
    } catch (error) {
      if (error.code === "ECONNABORTED") {
        throw new Error("Request timeout - the URL took too long to respond");
      }
      throw new Error(`Failed to fetch from URL: ${error.message}`);
    }
  }

  async loadFromFile(filePath) {
    try {
      const fileContent = readFileSync(filePath, "utf-8");
      return JSON.parse(fileContent);
    } catch (error) {
      if (error.code === "ENOENT") {
        throw new Error(`File not found: ${filePath}`);
      }
      if (error instanceof SyntaxError) {
        throw new Error(`Invalid JSON in file: ${error.message}`);
      }
      throw error;
    }
  }

  async deserialize(jsonData) {
    try {
      if (!jsonData || typeof jsonData !== "object") {
        throw new Error("Invalid TypeDoc JSON data - not an object");
      }

      if (!jsonData.kind || !jsonData.name) {
        throw new Error("Invalid TypeDoc JSON data - missing required fields");
      }

      const app = await Application.bootstrap();
      const deserializer = new Deserializer(app);

      const projectReflection = deserializer.reviveProject(jsonData);

      if (!(projectReflection instanceof ProjectReflection)) {
        throw new Error("Could not deserialize to ProjectReflection");
      }

      return projectReflection;
    } catch (error) {
      throw new Error(`Failed to deserialize TypeDoc JSON: ${error.message}`);
    }
  }
}
