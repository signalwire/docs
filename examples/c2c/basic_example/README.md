# SignalWire Click-to-Call Basic Example

This example demonstrates how to integrate SignalWire's Click-to-Call (C2C) widget into a website, allowing visitors to instantly connect with your business through voice calls directly from your website.

## Prerequisites

- A SignalWire account ([Sign up here](https://my.signalwire.com/))
- A website where you want to add the Click-to-Call feature
- A code editor and a terminal emulator
   - If you don't have either, VSCode is a very popular editor that includes a terminal.
- Git ([installation instructions](https://git-scm.com/downloads))
- Basic familiarity with the command line and web development (HTML, CSS, JS) is helpful but not required.

## Setup Instructions

### 1. Copy our example site

First, we'll download our ready-made site using Git.

- **Choose where to store the project files**
   - If you don't already have one, we recommend creating a `Code` folder in your user directory.
- **Open your terminal emulator**
- **Navigate to your desired folder in the terminal**
- **Run the following Git command:**

This command combines multiple Git commands to selectively download our C2C example from within the `docs` repository.
On Windows, make sure you run this command in Git Bash. It won't work in Powershell or Command Prompt.

```shell
git clone --sparse https://github.com/signalwire/docs.git SignalWire-Examples && cd SignalWire-Examples && git sparse-checkout set --no-cone 'examples/c2c/basic_example' && git checkout main
```

<!-- explanation
<details>
   <summary>What does that command do?  <i>(Click to expand)</i></summary>
   <ul>
      <li><code>git clone -n https://github.com/signalwire/docs.git SignalWire-Examples</code>: Clone the SignalWire Docs repo into a folder titled SignalWire-Examples. The `-n` flag stops Git from automatically checking out (downloading).</li>
      <li><code>cd SignalWire-Examples</code>: Move into the newly created directory</li>
      <li><code>git sparse-checkout init</code>: Enable Git's "Sparse Checkout" mode</li>
      <li><code>git sparse-checkout set examples/c2c/basic_example</code>: Tell Git which part of the repo we want to clone</li>
      <li><code>git checkout main</code>: Checkout the repo</li>
   </ul>
</details>
-->

### 2. Create a Click-to-Call Widget

1. Log in to your SignalWire Dashboard at [my.signalwire.com](https://my.signalwire.com/?page=click_to_calls)
2. Navigate to the Click-to-Call page
3. Click "Create a Click-to-Call Widget"
4. Configure your widget:
   - Give your widget a name
   - Select the destination(s) to call when the button is clicked
   - Choose whether to play a greeting message
   - Configure any additional settings as needed
5. Click "Create Widget" to generate your custom script

### 3. Add the Widget to Your Website

1. Copy the generated script from the SignalWire Dashboard
2. Open your website's HTML file (in this example, `public/index.html`)
3. Paste the script in the head section where you see:
   ```html
   <!-- Import the C2C script here -->
   ```

4. Uncomment or add the required HTML elements for the widget:
   ```html
   <div id="click2call"></div>
   <div id="call"></div>
   ```

### 4. Customize Your Widget

The default script will look something like this:

```javascript
// Async Loader IIFE - Do not modify this section except for the API key if necessary
(a => {
  // Loader implementation
  // ...
})({ apiKey: "c2c_XXXXXXXXXXXXXXXXXXXXX", v: "0.0.1" });

// Component initialization - Can be customized
sw.c2c.spawn('C2CButton', {
  destination: '/public/example',
  buttonParentSelector: '#click2call',
  callParentSelector: '#call'
});
```

#### Customization Options:

1. **Change Selector Elements**

   You can modify the selectors to match your page structure:

   ```javascript
   sw.c2c.spawn('C2CButton', {
     destination: '/public/example',
     buttonParentSelector: '#your-button-container',
     callParentSelector: '#your-call-container'
   });
   ```

2. **Add a Custom Button**

   Use the `innerHTML` property to create a custom button with our pre-defined styling:

   ```javascript
   sw.c2c.spawn('C2CButton', {
     destination: '/public/example',
     buttonParentSelector: '#click2call',
     callParentSelector: '#call',
     innerHTML: '<button class="demo-button">Call Us Now</button>'
   });
   ```

   The `demo-button` class will inherit the gradient styling defined in our CSS.

3. **Add Callback Functions**

   You can add functions to handle different call events:

   ```javascript
   sw.c2c.spawn('C2CButton', {
     destination: '/public/example',
     buttonParentSelector: '#click2call',
     callParentSelector: '#call',
     innerHTML: '<button class="demo-button">Call Us Now</button>',
     beforeCallStartFn: () => {
       console.log('Call is about to start');
       return true; // Allow the call to proceed
     },
     afterCallStartFn: () => {
       console.log('Call has started');
     },
     beforeCallLeaveFn: () => {
       return confirm('Are you sure you want to end this call?');
     },
     afterCallLeaveFn: () => {
       console.log('Call has ended');
     },
     onCallError: (error) => {
       console.error('Call error:', error);
     }
   });
   ```

## Testing Your Implementation

1. Open your website in a browser
2. You should see the Click-to-Call button in the location specified
3. Click the button to test:
   - A call interface should appear
   - A call should be initiated to your configured destination

## Additional Resources

- [Click-to-Call Documentation](https://developer.signalwire.com/tools/c2c)
- [Technical Reference](https://developer.signalwire.com/tools/c2c/technical-reference)
- [SignalWire Dashboard](https://my.signalwire.com/?page=click_to_calls) 
