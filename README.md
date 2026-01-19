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
