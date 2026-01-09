<br/>
<div align="center">
  <a href="https://www.buildwithfern.com/?utm_source=github&utm_medium=readme&utm_campaign=sdk-starter&utm_content=logo">
    <img src="/fern/docs/assets/fern-logo.png" height="50" align="center" alt="header" />
  </a>
  
  <br/>

# SDK Starter

Generate production-ready TypeScript and Python SDKs in under 5 minutes using Fern.

</div>

## Customer Showcase

Get inspired by SDKs built with Fern: [Merge](https://github.com/merge-api/merge-node-client) | [Square](https://github.com/square/square-go-sdk) | [ElevenLabs](https://github.com/elevenlabs/elevenlabs-python) | [Flatfile](https://github.com/FlatFilers/flatfile-node) |

---

## Requirements

- Node 18 or higher
- A [GitHub](https://github.com) account
- The [Fern GitHub App](https://github.com/apps/fern-api) installed

### Step 1: Use this template

1. Click on the **Use this template** button (found at the top right of this page). You must be logged into GitHub.
2. Choose the option to **create a new repository**. Name it whatever you'd like.

### Step 2: Clone and configure the repo

1. Clone your newly created repository and open it in your favorite code editor (e.g., VS Code).
2. Open `fern.config.json` and update the `organization` field with your organization name.

```json
{
  "organization": "signalwireanization-name",
  "version": "0.65.32"
}
```

### Step 3: Install and configure Fern

1. Install the Fern CLI globally:

```bash
npm install -g fern-api
```

2. Log in to Fern:

```bash
fern login
```

### Step 4: Configure your SDK settings

The repository comes pre-configured for TypeScript and Python SDK generation in `generators.yml`. You'll need to:

1. Create a GitHub repository for each SDK you want to generate
2. Install the [Fern GitHub App](https://github.com/apps/fern-api) in your target repository.
3. Uncomment and update the GitHub section in `generators.yml` with your repository information:

```yaml
# For Python SDK
github:
  repository: signalwire/your-python-sdk-repo

# For TypeScript SDK
github:
  repository: signalwire/your-typescript-sdk-repo
```

### Step 5: Generate your SDKs

To generate and publish your SDKs:

```bash
fern generate --group python-sdk
```

AND

```bash
fern generate --group ts-sdk
```

The generated SDKs will be:

- Committed to your specified GitHub repositories
- Published to npm (TypeScript) and PyPI (Python) if configured
- Version-controlled using semantic versioning

## Customization Options

The starter comes with some pre-configured options in `generators.yml`:

You can modify these configurations or add additional options by editing `generators.yml`.

---

## Link Checking

This repository includes automated link checking to detect broken external links in the documentation.

### How It Works

The link checker uses [Lychee](https://lychee.cli.rs/) to scan all URLs in the documentation sitemap. It handles GitHub URLs specially to avoid rate limiting issues:

- **GitHub blob/tree/tag URLs** are verified locally by cloning repositories (GitHub blocks automated HTTP requests to these URLs)
- **GitHub issues/PRs/discussions** are checked via HTTP with low concurrency
- **All other URLs** are checked via HTTP with standard concurrency

The checker includes retry logic with exponential backoff for rate-limited (429) responses and falls back to local verification for GitHub 5xx errors.

### Automated Checks

Link checking runs automatically in two scenarios:

1. **On Pull Requests**: The `preview-docs` workflow generates a preview deployment and checks all links, posting results as a PR comment
2. **Daily Production Check**: A scheduled workflow runs weekdays at 10am UTC to check the production site, with Slack notifications on failure

### Local Development

To run link checking locally:

1. Install [Lychee](https://lychee.cli.rs/):
   ```bash
   # macOS
   brew install lychee

   # Linux (cargo)
   cargo install lychee

   # Or download from releases
   # https://github.com/lycheeverse/lychee/releases
   ```

2. Run the link checker:
   ```bash
   # Check production sitemap
   npm run check-links

   # Check a specific sitemap (e.g., preview deployment)
   node scripts/check-links.js --sitemap https://preview-xxx.docs.buildwithfern.com/sitemap.xml

   # Skip GitHub verification for faster checks
   node scripts/check-links.js --skip-github

   # See all options
   node scripts/check-links.js --help
   ```

### Configuration

Link checker configuration is in `lychee.toml`. Key settings include excluded URLs (analytics, sites that block bots, etc.) and timeout/retry parameters.

---

## Support

Need help? [Set up a call](https://buildwithfern.com/contact) with an expert or email us at [support@buildwithfern.com](mailto:support@buildwithfern.com).
