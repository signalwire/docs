# Docusaurus Showcase 

## Installation
From the root of your Docusaurus project:
```bash
cd plugins
git clone https://github.com/andremartinssw/docusaurus-plugin-showcase.git
```

Add the plugin to your `package.json`:
```json
{
    ...
    "dependencies": {
        ...
        "docusaurus-plugin-showcase": "./plugins/docusaurus-plugin-showcase",
        ...
    }
    ...
}
```

Modify your `docusaurus.config.js` to load the plugin:
```javascript
...
    plugins: [
        'some-other-plugin',
        [
            'docusaurus-plugin-showcase',
            {
                include: "**/*.{md,mdx}",
                ignore: [
                    "**/node_modules/**",
                    "**/sdks/reference/**",
                    "**/docs/sdks/**",
                    "**/_*.mdx",
                    "**/_*.md"
                ],
                path: "docs",
                onlyLogFailedAttempts: true
            },
        ],
    ]
...
```

## Usage
1. Customize the `src/data/Tags.ts` file for your use case.
2. Customize files under `src/pages/showcase` to your liking.
2. Tag your articles with the tags you added to `Tags.ts`:
```markdown
---
title: WebRTC with SIP Over WebSockets
slug: /guides/webrtc-with-sip-over-websockets
sidebar_position: 2
x-custom:
  tags:
    - product:voice
    - product:video
  repo: https://github.com/andremartinssw/docusaurus-plugin-showcase
---
```

4. Once you're done customizing things, and inside the plugin's folder, run:
```bash
npm run build
```
5. You can now start your Docusaurus project and visit the `/showcase` page.
