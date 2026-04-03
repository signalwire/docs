/**
 * Server Variable Input - Custom JS for SignalWire Fern Docs
 *
 * Injects a labeled input field for OpenAPI server variables (e.g. space_name)
 * into the API Explorer ("Try It") panel. When the user fills in their space name,
 * the script updates the base URL so Fern uses it for requests and code samples.
 *
 * Strategy for updating the URL (tried in order):
 *   1. React fiber: walk the React component tree from the DOM to find the
 *      apiDefinitionId, then write the resolved URL to the correct
 *      localStorage key and dispatch a StorageEvent so Jotai re-reads.
 *   2. Double-click simulation: programmatically enter edit mode on the URL
 *      bar, set the value, and commit via Enter key.
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
  // Strategy 1: Jotai atomWithStorage via React fiber
  //
  // Fern stores the selected environment URL in localStorage keys:
  //   "selected-environment-url"                (global fallback)
  //   "selected-environment-url:<apiDefId>"     (per-API, used by playground)
  //
  // Jotai's atomWithStorage subscribes to `window` "storage" events.
  // We find the apiDefinitionId from the React fiber tree, then write to
  // the correct key and dispatch a StorageEvent.
  // ---------------------------------------------------------------------------

  /**
   * Walk the React fiber tree starting from a DOM element to find the
   * apiDefinitionId prop on MaybeEnvironmentDropdown or its ancestors.
   */
  function findApiDefinitionId() {
    var el = document.querySelector(".playground-endpoint-baseurl");
    if (!el) return null;

    // Find the React fiber key
    var fiberKey = null;
    var keys = Object.keys(el);
    for (var i = 0; i < keys.length; i++) {
      if (keys[i].indexOf("__reactFiber$") === 0) {
        fiberKey = keys[i];
        break;
      }
    }
    if (!fiberKey) return null;

    var fiber = el[fiberKey];
    var current = fiber;
    var depth = 0;

    while (current && depth < 60) {
      // Check memoizedProps for apiDefinitionId
      var props = current.memoizedProps;
      if (props && props.apiDefinitionId) {
        return props.apiDefinitionId;
      }
      // Also check pendingProps
      if (current.pendingProps && current.pendingProps.apiDefinitionId) {
        return current.pendingProps.apiDefinitionId;
      }
      current = current.return;
      depth++;
    }
    return null;
  }

  /**
   * Write a URL to the Jotai atomWithStorage key and dispatch a StorageEvent
   * so that React re-renders the URL bar and code samples.
   */
  function updateViaStorage(newUrl) {
    try {
      var apiDefId = findApiDefinitionId();

      var keys = [];

      // Always add the per-API key if we found the ID
      if (apiDefId) {
        keys.push("selected-environment-url:" + apiDefId);
      }

      // Also find any existing keys in localStorage
      for (var i = 0; i < localStorage.length; i++) {
        var lsKey = localStorage.key(i);
        if (lsKey && lsKey.indexOf("selected-environment-url") === 0) {
          if (keys.indexOf(lsKey) === -1) {
            keys.push(lsKey);
          }
        }
      }

      // Always include the global key as fallback
      if (keys.indexOf("selected-environment-url") === -1) {
        keys.push("selected-environment-url");
      }

      if (keys.length === 0) return false;

      // Write + dispatch for each key
      var encodedValue = JSON.stringify(newUrl);
      for (var k = 0; k < keys.length; k++) {
        var storageKey = keys[k];
        var oldValue = localStorage.getItem(storageKey);
        localStorage.setItem(storageKey, encodedValue);

        window.dispatchEvent(
          new StorageEvent("storage", {
            key: storageKey,
            oldValue: oldValue,
            newValue: encodedValue,
            storageArea: localStorage,
          })
        );
      }

      // Clear selected-environment-id so Fern does not override our URL
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
  // Strategy 2: Double-click simulation
  //
  // Programmatically enter edit mode on the URL bar, set the value via
  // React's native input setter, and commit via Enter key.
  // ---------------------------------------------------------------------------

  function updateViaDoubleClick(newUrl) {
    // Find the outer URL container
    var baseUrlContainer = document.querySelector(
      ".playground-endpoint-baseurl"
    );
    if (!baseUrlContainer) return false;

    // IMPORTANT: The onDoubleClick handler in Fern's MaybeEnvironmentDropdown
    // is on an INNER element, not the outer container. React's event delegation
    // only fires handlers from the event target UPWARD, so we must target
    // the correct element or one of its descendants.
    //
    // Single-environment: inner <span class="playground-endpoint-baseurl ...">
    // Dropdown: <button> element (FernButton)
    var target =
      // Inner span with same class as container (has onDoubleClick)
      baseUrlContainer.querySelector(
        "span.playground-endpoint-baseurl"
      ) ||
      // Dropdown button (FernButton with onDoubleClick)
      baseUrlContainer.querySelector("button") ||
      // Fallback: deepest span containing URL text
      (function () {
        var spans = baseUrlContainer.querySelectorAll("span");
        for (var i = spans.length - 1; i >= 0; i--) {
          var t = (spans[i].textContent || "").trim();
          if (t.indexOf("://") !== -1 && spans[i].children.length === 0) {
            return spans[i];
          }
        }
        return null;
      })();

    if (!target) target = baseUrlContainer;

    // Dispatch double-click to enter edit mode
    target.dispatchEvent(
      new MouseEvent("dblclick", {
        bubbles: true,
        cancelable: true,
        view: window,
      })
    );

    // Wait for React to re-render with the FernInput
    setTimeout(function () {
      var input =
        baseUrlContainer.querySelector("input") ||
        document.querySelector(
          ".playground-endpoint-baseurl input"
        ) ||
        document.querySelector(
          ".playground-endpoint-url input"
        ) ||
        document.querySelector(
          ".playground-endpoint-url-with-switcher input"
        );
      if (!input) {
        // Retry after a longer delay
        setTimeout(function () {
          input =
            baseUrlContainer.querySelector("input") ||
            document.querySelector(
              ".playground-endpoint-baseurl input"
            );
          if (input) commitInputValue(input, newUrl);
        }, 500);
        return;
      }
      commitInputValue(input, newUrl);
    }, 300);

    return true;
  }

  /**
   * Set a React-controlled input's value and commit it.
   */
  function commitInputValue(input, newUrl) {
    // Focus the input first
    input.focus();

    // Use the native value setter to bypass React's synthetic tracking
    var nativeSetter = Object.getOwnPropertyDescriptor(
      window.HTMLInputElement.prototype,
      "value"
    ).set;
    nativeSetter.call(input, newUrl);

    // Dispatch input event so React's onChange fires
    // This triggers FernInput's onValueChange -> setInputValue(newUrl)
    input.dispatchEvent(new Event("input", { bubbles: true }));
    input.dispatchEvent(new Event("change", { bubbles: true }));

    // Wait for React to process the state update and recalculate
    // isValidInput before committing via Enter key
    setTimeout(function () {
      // FernInput uses onKeyDownCapture which fires in capture phase
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

      // Fallback: blur also commits in MaybeEnvironmentDropdown
      setTimeout(function () {
        input.blur();
      }, 150);
    }, 300);
  }

  // ---------------------------------------------------------------------------
  // Combined URL updater - tries both strategies
  // ---------------------------------------------------------------------------

  function updateFernEnvironmentUrl(newUrl) {
    // Strategy 1: Jotai storage event (instant, no UI flicker)
    updateViaStorage(newUrl);

    // Strategy 2: Double-click fallback (always attempt after a delay)
    // The StorageEvent approach may not work within the same tab in all
    // browsers. The double-click approach directly uses Fern's editing
    // UI to commit the URL. We check after a delay whether strategy 1
    // succeeded before invoking strategy 2.
    setTimeout(function () {
      var baseUrlEl = document.querySelector(
        ".playground-endpoint-baseurl"
      );
      if (baseUrlEl) {
        var currentText = (baseUrlEl.textContent || "").trim();
        // If the URL no longer contains a placeholder, strategy 1 worked
        var hasPlaceholder = detectVariable(currentText);
        if (!hasPlaceholder && currentText.indexOf("://") !== -1) {
          return;
        }
      }
      // Strategy 1 didn't visibly update - try double-click simulation
      updateViaDoubleClick(newUrl);
    }, 800);
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

    // Strict duplicate check
    if (document.getElementById(SECTION_ID)) return;

    var baseUrlEl = document.querySelector(".playground-endpoint-baseurl");
    if (!baseUrlEl) return;

    var urlText = (baseUrlEl.textContent || "").trim();

    // Always render server variable input using the first configured variable.
    // We no longer gate on detecting a specific placeholder in the URL.
    var variable = VARIABLES[0];

    // Remember the template URL (the original URL before any replacement)
    if (!originalTemplateUrl || detectVariable(urlText)) {
      originalTemplateUrl = urlText;
    }

    var ui = createVariableSection(variable);

    // Inject inside the auth form box if possible, otherwise prepend to form
    var authBox = form.querySelector(".fern-explorer-auth-form");
    if (authBox) {
      authBox.appendChild(ui.section);
    } else {
      form.prepend(ui.section);
    }

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
      }, 500);
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
        originalTemplateUrl = null;
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
