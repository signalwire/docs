<!-- Header -->
<div align="center">
    <img src="website/static/img/logo.svg" width="500" href="https://signalwire.com" />
    <h1>SignalWire Docs</h1>
    <h4><i>An open-source docs site built with <a href="https://docusaurus.io/">🦕 Docusaurus</a></i></h4>
</div>
<p align="center">
  <a href="https://developer.signalwire.com/" target="_blank">📖 Explore the docs</a> •
  <a href="https://github.com/signalwire/signalwire-docs/issues/new/choose" target="_blank">🐛 Report an issue</a> •
  <a href="https://github.com/signalwire/signalwire-docs/pulls" target="_blank">✍️ Contribute</a>
</p>

<!-- Badges -->
<div align="center">
    <img src="https://img.shields.io/badge/Discord%20Community-5865F2" alt="Discord" href="https://discord.com/invite/F2WNYTNjuF"/>
    <img src="https://img.shields.io/badge/MIT-License-blue" alt="MIT License" href="LICENSE" />
    <img src="https://img.shields.io/badge/Creative%20Commons-license-blue.svg?logo=creativecommons&logoColor=ffffff"/>
    <img src="https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg" alt="Contributor Covenant" href="CODE_OF_CONDUCT.md"/>
    <img src="https://img.shields.io/badge/GitHub-%23121011.svg?logo=github&logoColor=white&" alt="GitHub" href="https://github.com/signalwire"/>
    <img src="https://img.shields.io/github/stars/signalwire/docs" alt="GitHub Stars" href="https://github.com/signalwire/docs"/>
</div>

<img src="website/static/img/homepage.png" alt="Homepage"/>


## Contents

- 💡 [Overview](#-overview)
  - 📚 [Docs Wiki](#-docs-wiki)
  - 🏗️ [Structure](#️-structure)
  - 📄 [License](#-license)
- ✍️ [Contribute](#️-contribute)
  - ☁️ [REST API docs](#️-rest-api-documentation)
- 🚀 [Usage](#-usage)
- 💬 [Contact & Support](#-contact-and-support)

## 💡 Overview

Welcome to SignalWire's open-source docs repository!

This README includes an overview of the project structure, requirements for contributors, and instructions for local development.

### 📚 Docs Wiki

The wiki hosts in-depth references and guides for maintaining, building, configuring, and deploying the docs site.

- [Configuration files](https://github.com/signalwire/signalwire-docs/wiki/Docusaurus-configuration-files)
- [Plugins](https://github.com/signalwire/signalwire-docs/wiki/Docusaurus-Plugins)
- [Licensing](https://github.com/signalwire/signalwire-docs/wiki/Licensing)
- [Pull Requests and Issues](https://github.com/signalwire/signalwire-docs/wiki/Guide-to-Pull-Requests-and-Issues)
- [REST API specs & docs](https://github.com/signalwire/signalwire-docs/wiki/REST-API-Specs-&-Docs)
- [Sidebars configuration](https://github.com/signalwire/signalwire-docs/wiki/Sidebars-Configuration)
- [Slugs: best practices](https://github.com/signalwire/signalwire-docs/wiki/Slugs:-Best-practices)
- [Written style guide](https://github.com/signalwire/signalwire-docs/wiki/Written-Style-Guide)

### 🏗️ Structure


The SignalWire Docs are built with <a href="https://docusaurus.io/">Docusaurus</a>.
Contents of the SignalWire Docs are organized by the following types:

- **Guides:** Introductions, quickstarts, examples, and how-to guides. These are written in Markdown/MDX and use the [docs plugin](https://docusaurus.io/docs/docs-introduction).
- **Technical Reference:** API and SDK reference docs. These also use the docs plugin, but in most cases are automatically generated from [TypeSpec](https://typespec.io/) or [OpenAPI](https://swagger.io/specification/) specification files.
- **Pages:** Standalone specialty pages that use the [pages plugin](https://docusaurus.io/docs/creating-pages), like the [Guides Showcase](https://developer.signalwire.com/guides) and unlisted references for UI components.

Consult the wiki's [Repository guide](https://github.com/signalwire/signalwire-docs/wiki/Repository-guide) for more information.

### 📜 License

The SignalWire Docs are available under the MIT license and Creative Commons **CC BY-NC-SA 4.0** license.

For more information, refer to the [Licensing wiki article](https://github.com/signalwire/signalwire-docs/wiki/Licensing).

---

## ✍️ Contribute

SignalWire welcomes contributions to the documentation!
Whether you're fixing a typo, making an issue for missing information, or submitting new content, 
your contributions will improve the experience for everyone in the SignalWire community.

1. Read [CONTRIBUTING.md](CONTRIBUTING.md), our [Code of Conduct](CODE_OF_CONDUCT.md), and the [SignalWire Privacy Policy](https://m.signalwire.com/policies?doc=privacy).
2. Review our [Guide to Pull Requests and Issues]([prs-issues-guide]), [Style Guide]([style-guide]), and [Pull Request and deploy preview process]([prs-deploy]).
3. [Fork the repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
4. Follow the [Usage](#usage) instructions to set up the local development environment.
5. Make your changes and [submit a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

> [!IMPORTANT]
> Contributions to the API docs require additional workflows.
> Refer to the [API docs guide](https://github.com/signalwire/signalwire-docs/wiki/REST-API-Specs-&-Docs) for in-depth instructions.

---

## 🚀 Usage

1. **Install prerequisites**

    - [Node.js](https://nodejs.org/en)

2. **Clone the repo**

3. **Install dependencies**

```
npm install
```

4. **Start the local development server**

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

```
npm run start
```

5. **Make your changes**

6. **Build**

This command generates static content into the `build` directory.

```
$ npm run build
```

The built site is now ready for deployment!

### ☁️ REST API documentation

The pages related to REST APIs are defined in [TypeSpec](https://typespec.io/docs) which are then compiled into [OpenAPI Spec](https://swagger.io/specification/) files. 
These files live in the [`api`](https://github.com/signalwire/signalwire-docs/tree/main/api) directory.

Refer to the [REST API Specs & Docs](https://github.com/signalwire/signalwire-docs/wiki/REST-API-Specs-&-Docs) wiki article for more information.

---

## 💬 Contact and Support

The SignalWire Docs are maintained by the Developer Experience team.
Have questions or feedback? Email us at devex@signalwire.com.

Contact Support via the [SignalWire Support Portal](https://support.signalwire.com/hc/en-us).

<!-- Links -->
[prs-issues-guide]: https://github.com/signalwire/signalwire-docs/wiki/Guidelines-to-Pull-Request-and-Issues
[style-guide]: https://github.com/signalwire/signalwire-docs/wiki/Style-Guidelines

[prs-deploy]: https://github.com/signalwire/signalwire-docs/wiki/Contributing-to-the-signalwire%E2%80%90docs-repository
