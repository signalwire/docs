export interface TagConfig {
  startingDirs: string[];
  allowedExtensions: string[];
  pathTags: Record<string, string[]>;
}

export const config: TagConfig = {
  // Starting directories for the tag system
  startingDirs: [
{{#startingDirs}}
    '{{{.}}}',
{{/startingDirs}}
  ],
  
  // File extensions to process
  allowedExtensions: ['.md', '.mdx'],
  
  // Path-to-tags mapping
  // Add your tags for each path below
  // More specific paths take precedence over general ones
  pathTags: {
{{#directories}}
    '{{{path}}}': [], 
{{/directories}}
  }
};