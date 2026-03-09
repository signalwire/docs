# Bug report: `from_name` rejected by SWML schema validator

## Summary

The `from_name` parameter on the `connect` method is supported by the runtime handler but **blocked by the schema validator**. Any SWML document using `from_name` will fail validation before execution.

## Reproduction

```yaml
version: 1.0.0
sections:
  main:
    - connect:
        from_name: "Noah Test"
        to: "sip:sip_test2@noah-space-7c08b602ff5e.sip.signalwire.com"
        timeout: 45
```

Expected: call connects with caller display name "Noah Test"
Actual: schema validation error — `Unknown parameter "from_name" in method "connect"`

## Root cause

The schema validator (`swml_schema.c`) checks every parameter key against an allowlist defined in the `SWML_CHECK_METHOD` / `SWML_CHECK` macros. `from_name` is missing from both allowlists.

| Location | File | `from_name` present? |
|---|---|---|
| `connect` method schema | `swml_schema.c:1482` | **NO** |
| `connect_device` schema | `swml_schema.c:1438` | **NO** |
| `create_connect_device()` runtime handler | `swml.c:4076` | **YES** |

### Schema (blocks the param)

`swml_schema.c:1482` — the `connect` method allowlist:

```c
SWML_CHECK_METHOD(connect, "from,headers,codecs,webrtc_media,fsvars,timeout,session_timeout,ringback,serial_parallel,serial,parallel,to,max_duration,answer_on_bridge,call_state_url,call_state_events,confirm,confirm_timeout,username,password,result,encryption,status_url,transfer_after_bridge,name,codec,status_url_method,realtime,authorization_bearer_token,custom_parameters")
```

`swml_schema.c:1438` — the `connect_device` allowlist:

```c
SWML_CHECK(connect_device, "to,from,headers,codecs,webrtc_media,timeout,session_timeout,fsvars,call_state_url,call_state_events,confirm,confirm_timeout,username,password,encryption,name,codec,status_url,status_url_method,realtime,authorization_bearer_token,custom_parameters")
```

Neither list includes `from_name`.

### Runtime (supports the param)

`swml.c:4076-4080` inside `create_connect_device()`:

```c
char *from_name = get_object_string_with_swml_vars(context, params, "from_name");
if (from_name) {
    ks_json_add_string_to_object(device_params, "from_name", from_name);
}
switch_safe_free(from_name);
```

This code correctly reads `from_name` from params and passes it to the relay SIP device. But the schema validator rejects the document before this code ever runs.

### Validation flow

```
SWML received
  → check_method_type_and_unknown_params() (swml_schema.c:873)
    → check_unknown_object_params() (swml_schema.c:856)
      → iterates every key, calls string_matches() against allowlist
      → "from_name" not in allowlist → returns error, validation fails
  → runtime handler never executes
```

## Fix

Two changes in `swml_schema.c`:

### 1. Add `from_name` to `connect` method allowlist (line 1482)

Add `,from_name` to the param string and add a validation line:

```c
SWML_CHECK_METHOD(connect, "from,from_name,headers,codecs,...")
// ...
SWML_CHECK_OPTIONAL_PARAM(from_name, -1, ks_json_check_string_is_any)
```

This covers the simple `to:` form where top-level params are passed directly as device params.

### 2. Add `from_name` to `connect_device` allowlist (line 1438)

Add `,from_name` to the param string and add a validation line:

```c
SWML_CHECK(connect_device, "to,from,from_name,headers,codecs,...")
// ...
SWML_CHECK_OPTIONAL_PARAM(from_name, -1, ks_json_check_string_is_any)
```

This covers the `serial`/`parallel`/`serial_parallel` forms where each device object can specify its own `from_name`.

## Additional findings (team investigation)

Two independent investigators confirmed all claims in this report. Additional facts:

### `dial` method is also affected

`swml_schema.c:1530` — the `dial` method allowlist also **does not include `from_name`**. The `dial` method shares the same `build_relay_devices_from_params` → `create_connect_device` call chain, so `from_name` is equally unreachable via `dial`.

### `from_name` only applies to SIP targets

The `from_name` handling in `create_connect_device()` is inside the SIP URI branch (`if (string_starts_with_sip_uri(to))`). It is not applicable to E.164, fabric address, queue, call, or stream targets.

### Relay API layer already supports it

The relay API layer (`relay_apis.c`) correctly includes `from_name`:
- `relay_apis.c:863` — `call_device_sip` allowlist includes `from_name`
- `relay_apis.c:871` — `JSON_CHECK_STRING_OPTIONAL(from_name, is_any)`

The relay handler (`relay.c`) reads `from_name` from device params and maps it to `"cnam"` (Caller ID Name) in the FreeSWITCH dial request:
- `relay.c:6362` / `relay.c:6742` — `cnam = ks_json_get_object_string(device_params, "from_name", NULL);`

This confirms the full downstream path works — only the SWML schema validation layer blocks it.

### Zero occurrences in `swml_schema.c`

A full-file search confirms `from_name` appears **zero times** in `swml_schema.c`. It was never added to any allowlist or validation check in the schema.

## Affected forms

| SWML form | Needs fix? |
|---|---|
| Simple `to:` (top-level `connect`) | Yes — `connect` method allowlist |
| `serial:` / `parallel:` / `serial_parallel:` (per-device `connect`) | Yes — `connect_device` allowlist |
| `dial` method (all forms) | Yes — `dial` method allowlist |

## Fix (3 changes in `swml_schema.c`)

### 1. Add `from_name` to `connect` method allowlist (line 1482)

Add `,from_name` to the param string and add a validation line:

```c
SWML_CHECK_METHOD(connect, "from,from_name,headers,codecs,...")
// ...
SWML_CHECK_OPTIONAL_PARAM(from_name, -1, ks_json_check_string_is_any)
```

### 2. Add `from_name` to `connect_device` allowlist (line 1438)

Add `,from_name` to the param string and add a validation line:

```c
SWML_CHECK(connect_device, "to,from,from_name,headers,codecs,...")
// ...
SWML_CHECK_OPTIONAL_PARAM(from_name, -1, ks_json_check_string_is_any)
```

### 3. Add `from_name` to `dial` method allowlist (line 1530)

Add `,from_name` to the param string and add a validation line:

```c
SWML_CHECK_METHOD(dial, "from,from_name,headers,codecs,...")
// ...
SWML_CHECK_OPTIONAL_PARAM(from_name, -1, ks_json_check_string_is_any)
```

## Branch / commit reference

Investigated on `mod_infrastructure` master at commit `10d55bf` (pulled 2026-02-24).
