declare module '*.scss' {
  const content: { [className: string]: string };
  export default content;
}

// Noticeable SDK global types
declare global {
  interface Window {
    noticeable: {
      render: (type: string, id: string, options?: any) => void;
      on: (event: string, callback: Function) => void;
      off: (event: string, callback: Function) => void;
      identify: (userId: string, userProperties?: any) => void;
      reset: () => void;
      destroy: () => void;
      ready: (callback: Function) => void;
      set: (properties: any) => void;
      do: (action: string, properties?: any) => void;
      is: (property: string) => any;
      safe: (callback: Function) => void;
      help: () => void;
      debug: (enabled: boolean) => void;
    };
  }
} 