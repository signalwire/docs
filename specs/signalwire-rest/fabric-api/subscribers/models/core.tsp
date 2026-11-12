import "../../../types";

using TypeSpec.Http;
using Types;

model SubscriberPathID {
  @doc("Unique ID of a Subscriber.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @path
  id: uuid;
}

model Subscriber {
  @doc("Unique ID of the Subscriber.")
  @example("d369a402-7b43-4512-8735-9d5e1f387814")
  id: uuid;

  @doc("Email of the Subscriber.")
  @example("johndoe@example.com")
  email: string;

  @doc("First name of the Subscriber, or `null` when not set.")
  @example("John")
  first_name: string | null;

  @doc("Last name of the Subscriber, or `null` when not set.")
  @example("Doe")
  last_name: string | null;

  @doc("Display name of the Subscriber, or `null` when not set.")
  @example("John Doe")
  display_name: string | null;

  @doc("Job title of the Subscriber, or `null` when not set.")
  @example("Software Engineer")
  job_title: string | null;

  @doc("Time zone of the Subscriber. Defaults to `GMT`.")
  @example("America/New_York")
  time_zone: string;

  @doc("Country of the Subscriber, or `null` when not set.")
  @example("United States")
  country: string | null;

  @doc("Company name of the Subscriber, or `null` when not set.")
  @example("SignalWire")
  company_name: string | null;
}
