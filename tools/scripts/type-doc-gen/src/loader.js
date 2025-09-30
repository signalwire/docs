import { readFileSync } from "fs";
import { Application, ProjectReflection, Deserializer } from "typedoc";
import axios from "axios";

export async function loadTypeDocData(input) {
  let jsonData;

  if (input.startsWith("http://") || input.startsWith("https://")) {
    console.log("Fetching data from URL...");
    const response = await axios.get(input);
    jsonData = response.data;
  } else {
    console.log("Reading data from file...");
    const fileContent = readFileSync(input, "utf-8");
    jsonData = JSON.parse(fileContent);
  }

  const app = await Application.bootstrap();
  const deserializer = new Deserializer(app);

  const projectReflection = deserializer.reviveProject(jsonData);

  if (!(projectReflection instanceof ProjectReflection)) {
    throw new Error(
      "Invalid TypeDoc JSON data - could not deserialize to ProjectReflection",
    );
  }

  return projectReflection;
}
