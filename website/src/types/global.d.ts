// website/src/types/global.d.ts
declare global {
  interface Window {
    noticeable: {
      render: (type: string, projectId: string, options?: { target?: string }) => void;
      [key: string]: any;
    };
  }
}

export {}; 