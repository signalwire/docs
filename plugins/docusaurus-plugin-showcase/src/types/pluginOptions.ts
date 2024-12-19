export interface pluginOptions {
  title: string,
  description: string,
  logging: boolean,
  include: string, // Extensions to include.
  ignore: [], // Extensions to ignore.
  path: string, // Path to data on filesystem, relative to site dir.
  routeBasePath: string, // URL Route.
  onlyLogFailedAttempts: boolean,
  page: string,
  prioritizeTags: [],
  tags: [],
  header: boolean,
  displayFavorites: boolean,
  displayTableOfContents: boolean,
  displaySearchBar: boolean,
  subSites: [
    {
      path: string,
      routeBasePath: string,
    }
  ]
}