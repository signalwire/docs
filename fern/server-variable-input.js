/**
 * Server Variable Input — Custom JS for SignalWire Fern Docs
 *
 * Injects a labeled input field for OpenAPI server variables (e.g. space_name)
 * into the API Explorer ("Try It") panel. When the user fills in their space name,
 * the script programmatically updates the base URL via Fern's double-click-to-edit
 * mechanism.
 *
 * How it works:
 *   1. A MutationObserver watches for `.playground-endpoint-baseurl` elements.
 *   2. If the displayed URL contains a known placeholder, an input field is injected
 *      into the explorer form (`.fern-explorer-form`).
 *   3. On input change, the script double-clicks the URL to enter edit mode,
 *      replaces the placeholder with the user's value, and triggers a save (Enter key).
 */
(function () {
  "use strict";

  // ---------------------------------------------------------------------------
  // Configuration
  // ---------------------------------------------------------------------------

  /** Known server-variable placeholders and their display metadata. */
  var VARIABLES = [
    {
      // Matches the default values from both OpenAPI specs
      patterns: [
        "{Your_Space_Name}",
        "YOUR_SPACE",
        "{your_space_name}",
        "{space_name}",
      ],
      label: "Space name",
      placeholder: "e.g. example",
      description:
        "Your SignalWire Space name — found in your SignalWire Dashboard.",
      storageKey: "sw_space_name",
    },
  ];

  // Flag to prevent duplicate injection
  var INJECTED_ATTR = "data-sw-server-var-injected";

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /**
   * Return the first variable config whose placeholder appears inside `url`.
   */
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

  /**
   * Replace a placeholder inside a URL string, case-insensitively.
   */
  function replaceVariable(url, variable, value) {
    var result = url;
    for (var i = 0; i < variable.patterns.length; i++) {
      var pattern = variable.patterns[i];
      var idx = result.toLowerCase().indexOf(pattern.toLowerCase());
      if (idx !== -1) {
        result =
          result.substring(0, idx) + value + result.substring(idx + pattern.length);
      }
    }
    return result;
  }

  /**
   * Read a saved value from localStorage (best-effort).
   */
  function loadSaved(key) {
    try {
      return localStorage.getItem(key) || "";
    } catch (_e) {
      return "";
    }
  }

  /**
   * Persist a value to localStorage (best-effort).
   */
  function savePersistent(key, value) {
    try {
      localStorage.setItem(key, value);
    } catch (_e) {
      // storage unavailable — silently ignore
    }
  }

  // ---------------------------------------------------------------------------
  // DOM Injection
  // ---------------------------------------------------------------------------

  /**
   * Build the "Server variables" section and prepend it to the explorer form.
   * Returns the <input> element so we can wire up the update logic.
   */
  function createVariableSection(variable) {
    // Outer wrapper — mirrors Fern's form section styling
    var section = document.createElement("div");
    section.className = "sw-server-var-section";

    // Title
    var title = document.createElement("div");
    title.className = "sw-server-var-title";
    title.textContent = "Server variables";
    section.appendChild(title);

    // Row: label + input
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

    // Description
    var desc = document.createElement("div");
    desc.className = "sw-server-var-desc";
    desc.textContent = variable.description;
    section.appendChild(desc);

    // Computed URL preview
    var preview = document.createElement("div");
    preview.className = "sw-server-var-preview";
    preview.textContent = "";
    section.appendChild(preview);

    return { section: section, input: input, preview: preview };
  }

  // ---------------------------------------------------------------------------
  // Core: update the Fern playground base URL
  // ---------------------------------------------------------------------------

  /**
   * Programmatically update the base URL in Fern's playground by:
   *   1. Double-clicking the URL element to enter edit mode.
   *   2. Finding the resulting <input>, setting its value.
   *   3. Dispatching Enter to commit the change.
   */
  function updateBaseUrl(newUrl) {
    // Find the base URL element (non-editing state)
    var baseUrlEl = document.querySelector(
      ".playground-endpoint-baseurl span[style*='pointer-events']," +
      ".playground-endpoint-baseurl .fern-button," +
      ".playground-endpoint-baseurl span.whitespace-nowrap," +
      ".playground-endpoint-baseurl > span"
    );

    if (!baseUrlEl) {
      // Try a broader selector
      baseUrlEl = document.querySelector(".playground-endpoint-baseurl");
    }

    if (!baseUrlEl) return false;

    // Trigger double-click to enter edit mode
    var dblClickEvent = new MouseEvent("dblclick", {
      bubbles: true,
      cancelable: true,
      view: window,
    });
    baseUrlEl.dispatchEvent(dblClickEvent);

    // Wait a tick for React to re-render with the input
    setTimeout(function () {
      var input = document.querySelector(
        ".playground-endpoint-baseurl input"
      );
      if (!input) {
        // Try broader — any input that appeared in the endpoint area
        input = document.querySelector(".playground-endpoint input[type='text']");
      }
      if (!input) return;

      // Set the value using native input value setter to trigger React's onChange
      var nativeInputValueSetter = Object.getOwnPropertyDescriptor(
        window.HTMLInputElement.prototype,
        "value"
      ).set;
      nativeInputValueSetter.call(input, newUrl);

      // Dispatch input event so React picks up the change
      input.dispatchEvent(new Event("input", { bubbles: true }));
      input.dispatchEvent(new Event("change", { bubbles: true }));

      // Small delay then trigger Enter to commit
      setTimeout(function () {
        input.dispatchEvent(
          new KeyboardEvent("keydown", {
            key: "Enter",
            code: "Enter",
            keyCode: 13,
            which: 13,
            bubbles: true,
            cancelable: true,
          })
        );

        // Also try blur as fallback
        setTimeout(function () {
          input.blur();
        }, 50);
      }, 50);
    }, 100);

    return true;
  }

  // ---------------------------------------------------------------------------
  // Main: observe the DOM and inject when the explorer appears
  // ---------------------------------------------------------------------------

  function processExplorer() {
    // Look for the explorer form area
    var form = document.querySelector(".fern-explorer-form");
    if (!form) return;

    // Already injected?
    if (form.getAttribute(INJECTED_ATTR)) return;

    // Look for the base URL to detect if it contains a variable
    var baseUrlEl = document.querySelector(
      ".playground-endpoint-baseurl"
    );
    if (!baseUrlEl) return;

    var urlText = baseUrlEl.textContent || "";
    var variable = detectVariable(urlText);
    if (!variable) return;

    // Mark as injected
    form.setAttribute(INJECTED_ATTR, "true");

    // Build and inject the UI
    var ui = createVariableSection(variable);

    // Insert before the auth form (first child of .fern-explorer-form)
    var authForm = form.querySelector(".fern-explorer-auth-form");
    if (authForm) {
      form.insertBefore(ui.section, authForm);
    } else {
      form.prepend(ui.section);
    }

    // Update the preview
    function updatePreview(value) {
      if (value) {
        var resolvedUrl = replaceVariable(urlText, variable, value);
        ui.preview.textContent = "Computed URL: " + resolvedUrl;
        ui.preview.style.display = "block";
      } else {
        ui.preview.textContent = "";
        ui.preview.style.display = "none";
      }
    }

    // Initialize preview with saved value
    updatePreview(ui.input.value);

    // If there's a saved value, apply it immediately
    if (ui.input.value) {
      var resolvedUrl = replaceVariable(urlText, variable, ui.input.value);
      // Small delay to ensure playground is fully initialized
      setTimeout(function () {
        updateBaseUrl(resolvedUrl);
      }, 500);
    }

    // Wire up input handler
    var debounceTimer = null;
    ui.input.addEventListener("input", function () {
      var value = ui.input.value.trim();
      savePersistent(variable.storageKey, value);
      updatePreview(value);

      // Debounce the actual URL update
      clearTimeout(debounceTimer);
      if (value) {
        debounceTimer = setTimeout(function () {
          // Re-read the current URL text in case it changed
          var currentUrlEl = document.querySelector(
            ".playground-endpoint-baseurl"
          );
          var currentUrl = currentUrlEl ? currentUrlEl.textContent || "" : urlText;

          // If the current URL still has a placeholder, replace it
          var detected = detectVariable(currentUrl);
          var targetUrl;
          if (detected) {
            targetUrl = replaceVariable(currentUrl, detected, value);
          } else {
            // URL was already replaced — reconstruct from the original template
            targetUrl = replaceVariable(urlText, variable, value);
          }
          updateBaseUrl(targetUrl);
        }, 600);
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Inject CSS
  // ---------------------------------------------------------------------------

  function injectStyles() {
    var style = document.createElement("style");
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

    // Process immediately in case the explorer is already rendered
    processExplorer();

    // Observe DOM mutations to catch when the explorer is opened/navigated
    var observer = new MutationObserver(function () {
      processExplorer();
    });

    observer.observe(document.body, {
      childList: true,
      subtree: true,
    });

    // Also re-process on URL changes (SPA navigation)
    var lastUrl = location.href;
    var urlCheckInterval = setInterval(function () {
      if (location.href !== lastUrl) {
        lastUrl = location.href;
        // Reset injection flag so the next explorer view gets processed
        var forms = document.querySelectorAll(
          ".fern-explorer-form[" + INJECTED_ATTR + "]"
        );
        forms.forEach(function (f) {
          f.removeAttribute(INJECTED_ATTR);
        });
        // Allow DOM to settle before processing
        setTimeout(processExplorer, 500);
      }
    }, 300);
  }

  // Start when DOM is ready
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
