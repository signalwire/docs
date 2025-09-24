FROM node:20 AS builder
WORKDIR /app

# Set memory limit for Node.js operations
ENV NODE_OPTIONS="--max-old-space-size=4096"

# Copy root package files first for better caching
COPY package*.json ./
COPY .yarnrc* ./
COPY tsconfig.json ./

# Copy workspace package.json files for dependency resolution
COPY website/package*.json ./website/
COPY specs/package*.json ./specs/
COPY tools/package*.json ./tools/

# Copy source code (needed for postinstall build)
COPY website ./website
COPY specs ./specs
COPY tools ./tools

# Install dependencies and run postinstall (builds specs and website)
RUN yarn install --frozen-lockfile

# Build the website
RUN yarn build:website

# Switch to website directory for final output
WORKDIR /app/website

# Production stage
FROM nginx
COPY --from=builder /app/website/provisioning/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/website/provisioning/nginx/redirects.map /etc/nginx/redirects.map
COPY --from=builder /app/website/build/ /usr/share/nginx/html

EXPOSE 80