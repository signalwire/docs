# SignalWire Click-to-Call Basic Example

This example demonstrates how to integrate SignalWire's Click-to-Call (C2C) widget into a website, allowing visitors to instantly connect with your business through voice calls directly from your website.

## Prerequisites

- A SignalWire account ([Sign up here](https://my.signalwire.com/))
- A website where you want to add the Click-to-Call feature

## Setup Instructions

### 1. Create a Click-to-Call Widget

1. Log in to your SignalWire Dashboard at [my.signalwire.com](https://my.signalwire.com/?page=click_to_calls)
2. Navigate to the Click-to-Call page
3. Click "Create a Click-to-Call Widget"
4. Configure your widget:
   - Give your widget a name
   - Select the destination(s) to call when the button is clicked
   - Choose whether to play a greeting message
   - Configure any additional settings as needed
5. Click "Create Widget" to generate your custom script

### 2. Add the Widget to Your Website

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

### 3. Customize Your Widget

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