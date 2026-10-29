import "./core.tsp";
import "@typespec/http";

using TypeSpec.Http;

model SubscriberRequest {
  @doc("Password of the Subscriber. Defaults to a secure random password if not provided.")
  @minLength(8)
  @maxLength(72)
  @example("password123")
  password?: string;

  @doc("Email of the Subscriber.")
  @example("johndoe@example.com")
  email: string;

  @doc("First name of the Subscriber.")
  @example("John")
  first_name?: string;

  @doc("Last name of the Subscriber.")
  @example("Doe")
  last_name?: string;

  @doc("Display name of the Subscriber.")
  @example("John Doe")
  display_name?: string;

  @doc("Job title of the Subscriber.")
  @example("Software Engineer")
  job_title?: string;

  @doc("Time zone of the Subscriber. Defaults to `GMT` if not provided.")
  @example("America/New_York")
  time_zone?: string;

  @doc("Country of the Subscriber.")
  @example("United States")
  country?: string;

  @doc("Company name of the Subscriber.")
  @example("SignalWire")
  company_name?: string;
}

// Update reads the same fields as create, but every field is optional: an omitted
// field keeps its current value, and the password changes only when one is sent.
model SubscriberUpdateRequest {
  @doc("New password for the Subscriber. Omit to keep the current password.")
  @minLength(8)
  @maxLength(72)
  @example("password123")
  password?: string;

  @doc("Email of the Subscriber.")
  @example("johndoe@example.com")
  email?: string;

  ...OmitProperties<SubscriberRequest, "password" | "email">;
}
