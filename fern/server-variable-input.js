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
      fieldName: "space_name",
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

  /**
   * Given a template URL (with placeholder) and a current URL (with the
   * placeholder replaced), extract the value that replaced the placeholder.
   * For example:
   *   template: "https://{Your_Space_Name}.signalwire.com/api/rest"
   *   current:  "https://myspace.signalwire.com/api/rest"
   *   => "myspace"
   */
  function extractVariableValue(templateUrl, currentUrl, variable) {
    if (!templateUrl || !currentUrl) return null;
    for (var i = 0; i < variable.patterns.length; i++) {
      var pattern = variable.patterns[i];
      var idx = templateUrl.toLowerCase().indexOf(pattern.toLowerCase());
      if (idx === -1) continue;
      var prefix = templateUrl.substring(0, idx);
      var suffix = templateUrl.substring(idx + pattern.length);
      // Check that the current URL starts with the same prefix
      if (currentUrl.substring(0, prefix.length) !== prefix) continue;
      // Check that the current URL ends with the same suffix
      if (suffix.length > 0) {
        var suffixIdx = currentUrl.indexOf(suffix, prefix.length);
        if (suffixIdx === -1) continue;
        return currentUrl.substring(prefix.length, suffixIdx);
      }
      return currentUrl.substring(prefix.length);
    }
    return null;
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

  /**
   * Create the server variable field as a standalone <div> that sits between
   * the auth trigger button and the collapsible auth content. Uses the same
   * Fern auth-field classes (fern-input-group, fern-input, font-mono) so it
   * looks like a native part of the auth card.
   */
  function createVariableField(variable) {
    // Outer wrapper — uses the same padding / spacing as auth field <li> items
    var wrapper = document.createElement("div");
    wrapper.id = SECTION_ID;
    wrapper.className = "space-y-2 px-4 pt-4";

    // Label: <label class="inline-flex flex-wrap items-baseline">
    //          <span class="font-mono text-sm">space_name</span>
    //        </label>
    var label = document.createElement("label");
    label.className = "inline-flex flex-wrap items-baseline";
    var labelSpan = document.createElement("span");
    labelSpan.className = "font-mono text-sm";
    labelSpan.textContent = variable.fieldName || "space_name";
    label.appendChild(labelSpan);
    wrapper.appendChild(label);

    // Input: <div><div class="fern-input-group"><input class="fern-input" /></div></div>
    var inputWrapper = document.createElement("div");
    var inputGroup = document.createElement("div");
    inputGroup.className = "fern-input-group";
    var input = document.createElement("input");
    input.type = "text";
    input.className = "fern-input";
    input.placeholder = variable.placeholder;
    input.value = loadSaved(variable.storageKey);
    inputGroup.appendChild(input);
    inputWrapper.appendChild(inputGroup);
    wrapper.appendChild(inputWrapper);

    // Small description text below input
    var desc = document.createElement("p");
    desc.className = "t-muted text-xs mt-1";
    desc.textContent = variable.description;
    wrapper.appendChild(desc);

    // Preview of resolved URL (hidden when empty)
    var preview = document.createElement("div");
    preview.className = "sw-server-var-preview";
    preview.textContent = "";
    wrapper.appendChild(preview);

    return { wrapper: wrapper, input: input, preview: preview };
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
    var variable = VARIABLES[0];

    // Remember the template URL (the original URL before any replacement)
    if (!originalTemplateUrl || detectVariable(urlText)) {
      originalTemplateUrl = urlText;
    }

    var ui = createVariableField(variable);

    // Inject between the auth trigger button and the collapsible content.
    // DOM structure inside .fern-explorer-auth-form:
    //   <div class="relative">
    //     <button data-state="...">...trigger banner...</button>
    //     <!-- INSERT HERE -->
    //     <div>  <!-- Radix Collapsible.Root -->
    //       <div class="fern-collapsible">...</div>
    //     </div>
    //   </div>
    var authForm = form.querySelector(".fern-explorer-auth-form");
    var inserted = false;

    if (authForm) {
      // The auth card root is .relative > (button + collapsible)
      var relativeContainer = authForm.querySelector(".relative");
      if (relativeContainer) {
        // Find the trigger button (first child button with data-state)
        var triggerBtn = relativeContainer.querySelector(
          "button[data-state]"
        );
        if (triggerBtn && triggerBtn.nextElementSibling) {
          // Insert after the trigger button, before the collapsible
          relativeContainer.insertBefore(
            ui.wrapper,
            triggerBtn.nextElementSibling
          );
          inserted = true;
        }
      }

      // Fallback: append inside auth form if we couldn't find the right spot
      if (!inserted) {
        authForm.appendChild(ui.wrapper);
        inserted = true;
      }
    }

    // Final fallback: prepend to form
    if (!inserted) {
      form.prepend(ui.wrapper);
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
    var updatingFromInput = false;
    ui.input.addEventListener("input", function () {
      var value = ui.input.value.trim();
      savePersistent(variable.storageKey, value);
      updatePreview(value);

      clearTimeout(debounceTimer);
      debounceTimer = setTimeout(function () {
        updatingFromInput = true;
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
        // Reset the flag after a generous delay so our own URL-bar
        // mutation doesn't trigger reverse sync.
        setTimeout(function () {
          updatingFromInput = false;
        }, 2000);
      }, 400);
    });

    // -----------------------------------------------------------------------
    // Reverse sync: URL bar → input field
    // When the user edits the URL bar directly (via double-click),
    // extract the space name and update our input field to match.
    // -----------------------------------------------------------------------
    var urlBarObserver = new MutationObserver(function () {
      if (updatingFromInput) return;
      var baseUrl = document.querySelector(
        ".playground-endpoint-baseurl"
      );
      if (!baseUrl) return;
      var currentText = (baseUrl.textContent || "").trim();
      if (!currentText || currentText.indexOf("://") === -1) return;

      // If the URL still has a placeholder, nothing to extract
      if (detectVariable(currentText)) return;

      var template = originalTemplateUrl || urlText;
      if (!template) return;

      var extracted = extractVariableValue(
        template,
        currentText,
        variable
      );
      if (
        extracted !== null &&
        extracted !== ui.input.value.trim()
      ) {
        ui.input.value = extracted;
        savePersistent(variable.storageKey, extracted);
        updatePreview(extracted);
      }
    });

    // Observe the URL bar element for text changes
    if (baseUrlEl) {
      urlBarObserver.observe(baseUrlEl, {
        childList: true,
        subtree: true,
        characterData: true,
      });
    }
  }

  // ---------------------------------------------------------------------------
  // Inject CSS
  // ---------------------------------------------------------------------------

  function injectStyles() {
    if (document.getElementById("sw-server-var-styles")) return;
    var style = document.createElement("style");
    style.id = "sw-server-var-styles";
    style.textContent = [
      // Preview line below the input
      ".sw-server-var-preview {",
      "  font-size: 0.75rem;",
      "  font-family: var(--font-code, monospace);",
      "  color: var(--accent, #044ef4);",
      "  margin-top: 4px;",
      "  padding: 4px 8px;",
      "  background: color-mix(in srgb, var(--accent, #044ef4), transparent 92%);",
      "  border-radius: 4px;",
      "  word-break: break-all;",
      "  display: none;",
      "}",
      ".dark .sw-server-var-preview {",
      "  color: var(--accent, #40e0d0);",
      "  background: color-mix(in srgb, var(--accent, #40e0d0), transparent 90%);",
      "}",
      // Subtle muted text for description
      ".t-muted {",
      "  color: var(--grayscale-a11, #6b7280);",
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

    // Re-process on SPA navigation.
    // Instead of removing and re-injecting (which causes a visible flash),
    // we keep the existing element if it's still in the DOM and only
    // update the template URL.
    var lastUrl = location.href;
    setInterval(function () {
      if (location.href !== lastUrl) {
        lastUrl = location.href;
        originalTemplateUrl = null;
        // The MutationObserver will fire when the new page renders and
        // call processExplorer(). Only remove the old element if it's
        // no longer inside a live form (i.e. React unmounted it).
        var old = document.getElementById(SECTION_ID);
        if (old && !old.closest(".fern-explorer-form")) {
          old.remove();
        }
      }
    }, 300);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
