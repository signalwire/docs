import type { Heading } from 'mdast';

/**
 * Represents properties for an HTML element.
 */
export type HProperties = {
  id?: string;
};

/**
 * Extends the Data interface to include HTML properties.
 */
export interface DataWithHProperties {
  hProperties?: HProperties;
}

/**
 * Extends the Heading interface to include additional data properties.
 */
export interface HeadingWithProperties extends Heading {
  data?: DataWithHProperties;
}
