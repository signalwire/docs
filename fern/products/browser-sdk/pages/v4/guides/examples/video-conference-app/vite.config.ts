import { defineConfig } from 'vite';

// The client calls /api/sat and /api/sat/refresh during dev — proxy them to
// the backend process started by `npm run dev:server`.
export default defineConfig({
  server: {
    port: 5173,
    host: true,
    proxy: {
      '/api': {
        target: 'http://localhost:3001',
        changeOrigin: true
      }
    }
  }
});
