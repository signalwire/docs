import type { Options as GfmOptions } from 'remark-gfm';
import stringWidth from 'string-width';

/**
 * Default options for remark-gfm plugin
 */
export const defaultGfm: GfmOptions = {
  singleTilde: false,
  tableCellPadding: true,
  tablePipeAlign: true,
  stringLength: stringWidth,
}; 