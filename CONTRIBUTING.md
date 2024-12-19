# Contribution Guidelines

Thanks for contributing to SignalWire Docs. Here are a few guidelines that can
help you to get started.

If you are looking for the style guide, you can find it
[here](https://github.com/signalwire/signalwire-docs/wiki/Style-Guidelines).

## ℹ️ General information

The documentation in this repository is updated through the use of Pull Requests
(PRs). Whenever you need to make a change, you should open a PR which will get
peer reviewed. After you have addressed all the comments of the reviewers, your
PR will be merged to the main branch.

Whenever a commit is pushed to the main branch, for example after merging a PR,
a Continuous Integration pipeline builds and deploys the changes. The new
changes will be online in the public website seconds after the PR has been
merged. Because of this, **it is critical that all PRs are tested before being
merged**, and that all the GitHub Actions (aka "checks") are successful (i.e.,
they should display a green check sign).

You can test a PR either by cloning the repo and building the branch, or by
using our automated preview deployments. Every time you add a new commit to a
PR, we automatically build the PR and we provide a link to test the end result.
The link will appear, after a few minutes from the commit, in a comment by
"netlify bot" within the PR.

If you are working on a PR and you want to avoid for it to be merged (i.e.,
published) by mistake, you can add "WIP" to the title of the PR – for example,
"_WIP: update SMS guide_". This will add a check that will remain in "pending"
state, and will only become successful after you remove the "WIP" keyword from
the title.

## 📖 Typical workflow for Guides

For simple changes, such as rewriting a sentence, fixing typos, or moving things
around in a guide, you can typically use the GitHub editor to make your
improvements directly from the browser. When saving your changes, you will be
asked to create a new PR. Until the PR is merged, you can keep adding any
related changes to that PR without the need to create a new one.

For more complex changes, such as writing a guide from scratch, reorganizing
files, or adding images, we suggest that you clone the repo and work locally on
your computer. This will allow you to easily preview your changes before opening
a PR.

## 🤔 FAQ

### I get a 404 error instead of the landing page

If you are starting the site with `npm run start`, this is normal:
for technical reasons, the landing page is only available in the final build.
If you need to work on the landing page, run the following command:

```npm run build && npm run serve```

### I get a 404 error when trying to open any REST API page

If you are starting the site with `npm run start`, this is normal.
For performance reasons, the REST-related pages belong to their own sub-site.
If you need to work on the REST APIs, then switch to the appropriate directory and start the specific sub-site:

```cd sites/relay-rest && npm run start```

If you want to test the whole site at once, use the following command:

```npm run build && npm run serve```
