/**
 * Server Variable Input — Custom JS for SignalWire Fern Docs
 *
 * Injects a labeled input field for OpenAPI server variables (e.g. space_name)
 * into the API Explorer ("Try It") panel. When the user fills in their space name,
 * the script updates the base URL through Fern's Jotai atomWithStorage mechanism
 * (writing to localStorage and dispatching a storage event so React re-reads it).
 *
 * How it works:
 *   1. A MutationObserver watches for `.playground-endpoint-baseurl` elements.
 *   2. If the displayed URL contains a known placeholder, a single input field is
 *      injected into the explorer form (`.fern-explorer-form`).
 *   3. On input change the script:
 *      a. Computes the resolved URL by replacing the placeholder.
 *      b. Writes the resolved URL to all `selected-environment-url*` localStorage
 *         keys that Fern's Jotai atoms read from.
 *      c. Dispatches a synthetic `storage` event so Jotai re-reads the value and
 *         React re-renders the URL bar + code samples.
 */
(function () {
  "use strict";

  // ---------------------------------------------------------------------------
  // Configuration
  // ---------------------------------------------------------------------------

  var VARIABLES = [
    {
      patterns: [
        "{Your_Space_Name}",
        "YOUR_SPACE",
        "{your_space_name}",
        "{space_name}",
      ],
      label: "Space name",
      placeholder: "e.g. example",
      description:
        "Your SignalWire Space name \u2014 found in your SignalWire Dashboard.",
      storageKey: "sw_space_name",
    },
  ];

  // Unique ID for our injected section to prevent duplicates
  var SECTION_ID = "sw-server-var-section";

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  function detectVariable(url) {
    if (!url) return null;
    var lower = url.toLowerCase();
    for (var i = 0; i < VARIABLES.length; i++) {
      var v = VARIABLES[i];
      for (var j = 0; j < v.patterns.length; j++) {
        if (lower.indexOf(v.patterns[j].toLowerCase()) !== -1) {
          return v;
        }
      }
    }
    return null;
  }

  function replaceVariable(url, variable, value) {
    var result = url;
    for (var i = 0; i < variable.patterns.length; i++) {
      var pattern = variable.patterns[i];
      var idx = result.toLowerCase().indexOf(pattern.toLowerCase());
      if (idx !== -1) {
        result =
          result.substring(0, idx) +
          value +
          result.substring(idx + pattern.length);
      }
    }
    return result;
  }

  function loadSaved(key) {
    try {
      return localStorage.getItem(key) || "";
    } catch (_e) {
      return "";
    }
  }

  function savePersistent(key, value) {
    try {
      localStorage.setItem(key, value);
    } catch (_e) {}
  }

  // ---------------------------------------------------------------------------
  // Core: update the Fern playground base URL via Jotai atomWithStorage
  // ---------------------------------------------------------------------------

  /**
   * Fern stores the selected environment URL in localStorage keys like:
   *   "selected-environment-url"           (global fallback)
   *   "selected-environment-url:<apiId>"   (per-API)
   *
   * Jotai's atomWithStorage listens for the `storage` event to sync across
   * tabs/components, so we:
   *   1. Write the resolved URL into every matching localStorage key.
   *   2. Dispatch a `storage` event for each key so Jotai re-reads it.
   *
   * This causes React to re-render the URL bar AND the code samples.
   */
  function updateFernEnvironmentUrl(newUrl) {
    try {
      var keys = [];
      for (var i = 0; i < localStorage.length; i++) {
        var key = localStorage.key(i);
        if (key && key.indexOf("selected-environment-url") === 0) {
          keys.push(key);
        }
      }

      // Always include the global key
      if (keys.indexOf("selected-environment-url") === -1) {
        keys.push("selected-environment-url");
      }

      // Write + dispatch for each key
      var encodedValue = JSON.stringify(newUrl);
      for (var k = 0; k < keys.length; k++) {
        var storageKey = keys[k];
        var oldValue = localStorage.getItem(storageKey);
        localStorage.setItem(storageKey, encodedValue);

        // Jotai listens for the native storage event
        window.dispatchEvent(
          new StorageEvent("storage", {
            key: storageKey,
            oldValue: oldValue,
            newValue: encodedValue,
            storageArea: localStorage,
          })
        );
      }

      // Also clear the selected environment ID so Fern does not override
      // our custom URL with the environment default
      var envIdKey = "selected-environment-id";
      var oldEnvId = localStorage.getItem(envIdKey);
      localStorage.setItem(envIdKey, JSON.stringify(undefined));
      window.dispatchEvent(
        new StorageEvent("storage", {
          key: envIdKey,
          oldValue: oldEnvId,
          newValue: JSON.stringify(undefined),
          storageArea: localStorage,
        })
      );

      return true;
    } catch (_e) {
      return false;
    }
  }

  // ---------------------------------------------------------------------------
  // DOM Injection
  // ---------------------------------------------------------------------------

  function createVariableSection(variable) {
    var section = document.createElement("div");
    section.id = SECTION_ID;
    section.className = "sw-server-var-section";

    var title = document.createElement("div");
    title.className = "sw-server-var-title";
    title.textContent = "Server variables";
    section.appendChild(title);

    var row = document.createElement("div");
    row.className = "sw-server-var-row";

    var label = document.createElement("label");
    label.className = "sw-server-var-label";
    label.textContent = variable.label;
    row.appendChild(label);

    var input = document.createElement("input");
    input.type = "text";
    input.className = "sw-server-var-input";
    input.placeholder = variable.placeholder;
    input.value = loadSaved(variable.storageKey);
    row.appendChild(input);

    section.appendChild(row);

    var desc = document.createElement("div");
    desc.className = "sw-server-var-desc";
    desc.textContent = variable.description;
    section.appendChild(desc);

    var preview = document.createElement("div");
    preview.className = "sw-server-var-preview";
    preview.textContent = "";
    section.appendChild(preview);

    return { section: section, input: input, preview: preview };
  }

  // ---------------------------------------------------------------------------
  // Main: observe the DOM and inject when the explorer appears
  // ---------------------------------------------------------------------------

  // Keep a reference to the original (template) URL so we can always
  // re-derive the resolved URL even after it has been replaced.
  var originalTemplateUrl = null;

  function processExplorer() {
    var form = document.querySelector(".fern-explorer-form");
    if (!form) return;

    // Strict duplicate check: if our section already exists anywhere in the
    // document, do nothing.
    if (document.getElementById(SECTION_ID)) return;

    var baseUrlEl = document.querySelector(".playground-endpoint-baseurl");
    if (!baseUrlEl) return;

    var urlText = (baseUrlEl.textContent || "").trim();
    var variable = detectVariable(urlText);

    // If no variable placeholder is detected but we have a saved template URL,
    // it means the URL was already resolved. Still inject the input so the user
    // can change it.
    if (!variable && originalTemplateUrl) {
      variable = detectVariable(originalTemplateUrl);
      if (variable) {
        urlText = originalTemplateUrl;
      }
    }

    if (!variable) return;

    // Remember the template URL
    if (!originalTemplateUrl || detectVariable(urlText)) {
      originalTemplateUrl = urlText;
    }

    var ui = createVariableSection(variable);

    // Insert at the top of the form
    form.prepend(ui.section);

    // Preview helper
    function updatePreview(value) {
      if (value) {
        var resolvedUrl = replaceVariable(
          originalTemplateUrl || urlText,
          variable,
          value
        );
        ui.preview.textContent = resolvedUrl;
        ui.preview.style.display = "block";
      } else {
        ui.preview.textContent = "";
        ui.preview.style.display = "none";
      }
    }

    updatePreview(ui.input.value);

    // If there is a saved value, apply it immediately
    if (ui.input.value) {
      var resolvedUrl = replaceVariable(
        originalTemplateUrl || urlText,
        variable,
        ui.input.value
      );
      setTimeout(function () {
        updateFernEnvironmentUrl(resolvedUrl);
      }, 300);
    }

    // Wire up input handler
    var debounceTimer = null;
    ui.input.addEventListener("input", function () {
      var value = ui.input.value.trim();
      savePersistent(variable.storageKey, value);
      updatePreview(value);

      clearTimeout(debounceTimer);
      debounceTimer = setTimeout(function () {
        if (value) {
          var targetUrl = replaceVariable(
            originalTemplateUrl || urlText,
            variable,
            value
          );
          updateFernEnvironmentUrl(targetUrl);
        } else {
          // If cleared, restore the original template URL
          updateFernEnvironmentUrl(originalTemplateUrl || urlText);
        }
      }, 400);
    });
  }

  // ---------------------------------------------------------------------------
  // Inject CSS
  // ---------------------------------------------------------------------------

  function injectStyles() {
    if (document.getElementById("sw-server-var-styles")) return;
    var style = document.createElement("style");
    style.id = "sw-server-var-styles";
    style.textContent = [
      ".sw-server-var-section {",
      "  border: 1px solid var(--border, #e2e2e5);",
      "  border-radius: 8px;",
      "  padding: 16px;",
      "  margin-bottom: 16px;",
      "  background: var(--card-background, #f8f9fa);",
      "}",
      ".dark .sw-server-var-section {",
      "  border-color: var(--border, #2e2e2e);",
      "  background: var(--card-background, #1a1a2e);",
      "}",
      ".sw-server-var-title {",
      "  font-size: 0.75rem;",
      "  font-weight: 600;",
      "  text-transform: uppercase;",
      "  letter-spacing: 0.05em;",
      "  color: var(--grayscale-a11, #6b7280);",
      "  margin-bottom: 10px;",
      "}",
      ".sw-server-var-row {",
      "  display: flex;",
      "  align-items: center;",
      "  gap: 12px;",
      "}",
      ".sw-server-var-label {",
      "  font-size: 0.875rem;",
      "  font-weight: 500;",
      "  color: var(--grayscale-12, #111827);",
      "  white-space: nowrap;",
      "  min-width: 90px;",
      "}",
      ".dark .sw-server-var-label {",
      "  color: var(--grayscale-12, #e5e7eb);",
      "}",
      ".sw-server-var-input {",
      "  flex: 1;",
      "  padding: 6px 10px;",
      "  font-size: 0.875rem;",
      "  font-family: var(--font-code, monospace);",
      "  border: 1px solid var(--border, #d1d5db);",
      "  border-radius: 6px;",
      "  background: var(--background, #fff);",
      "  color: var(--grayscale-12, #111827);",
      "  outline: none;",
      "  transition: border-color 0.15s;",
      "}",
      ".dark .sw-server-var-input {",
      "  border-color: var(--border, #374151);",
      "  background: var(--background, #0e0e18);",
      "  color: var(--grayscale-12, #e5e7eb);",
      "}",
      ".sw-server-var-input:focus {",
      "  border-color: var(--accent, #044ef4);",
      "  box-shadow: 0 0 0 2px color-mix(in srgb, var(--accent, #044ef4), transparent 80%);",
      "}",
      ".sw-server-var-input::placeholder {",
      "  color: var(--grayscale-a8, #9ca3af);",
      "}",
      ".sw-server-var-desc {",
      "  font-size: 0.75rem;",
      "  color: var(--grayscale-a11, #6b7280);",
      "  margin-top: 6px;",
      "}",
      ".sw-server-var-preview {",
      "  font-size: 0.75rem;",
      "  font-family: var(--font-code, monospace);",
      "  color: var(--accent, #044ef4);",
      "  margin-top: 8px;",
      "  padding: 6px 10px;",
      "  background: color-mix(in srgb, var(--accent, #044ef4), transparent 92%);",
      "  border-radius: 4px;",
      "  word-break: break-all;",
      "  display: none;",
      "}",
      ".dark .sw-server-var-preview {",
      "  color: var(--accent, #40e0d0);",
      "  background: color-mix(in srgb, var(--accent, #40e0d0), transparent 90%);",
      "}",
    ].join("\n");
    document.head.appendChild(style);
  }

  // ---------------------------------------------------------------------------
  // Initialization
  // ---------------------------------------------------------------------------

  function init() {
    injectStyles();
    processExplorer();

    // Observe DOM mutations - debounced to avoid rapid re-processing
    var mutationTimer = null;
    var observer = new MutationObserver(function () {
      clearTimeout(mutationTimer);
      mutationTimer = setTimeout(processExplorer, 150);
    });

    observer.observe(document.body, {
      childList: true,
      subtree: true,
    });

    // Re-process on SPA navigation
    var lastUrl = location.href;
    setInterval(function () {
      if (location.href !== lastUrl) {
        lastUrl = location.href;
        // Remove old section so processExplorer re-creates if needed
        var old = document.getElementById(SECTION_ID);
        if (old) old.remove();
        setTimeout(processExplorer, 500);
      }
    }, 300);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
