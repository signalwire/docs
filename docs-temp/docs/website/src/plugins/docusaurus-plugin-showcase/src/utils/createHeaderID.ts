import { ArticleHeader } from 'types/articles';
import { Tag } from "types/articles";

type CreateHeaderParent = {
  label: {
    message: string;
  },
  parentHeaderID?: string;  // Parent header's ID instead of the entire parent object
};

function createHeaderID({ label, parentHeaderID }: CreateHeaderParent): string {
  // Base case: If there is no parentHeaderID, return the sanitized label message
  if (!parentHeaderID) {
    return label.message.toLowerCase().replace(/\s+/g, '-');
  }

  // Recursive case: Concatenate parent header's ID with current label message
  // This requires having access to all headers if we wanted to keep it truly recursive,
  // but we simplify by assuming parentHeaderID is properly formed up to this point.
  return `${parentHeaderID}-${label.message.toLowerCase().replace(/\s+/g, '-')}`;
}

export default createHeaderID;
