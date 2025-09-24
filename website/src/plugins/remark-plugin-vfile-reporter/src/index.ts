import { reporter } from "vfile-reporter";

interface Options {}

export default function vfile_reporter(options: Options = {}) {
  return (tree: any, vfile: any) => {
    if (vfile.messages.length > 0) {
      console.error(reporter(vfile, { quiet: true }));
    }
  };
}
