FROM node:20 AS builder
WORKDIR /app
COPY . /app
RUN npm run install-ci && npm run build && npm run check-links


FROM nginx
COPY provisioning/nginx/nginx.conf /etc/nginx/nginx.conf
COPY provisioning/nginx/redirects.map /etc/nginx/redirects.map
COPY --from=builder /app/build/ /usr/share/nginx/html

EXPOSE 80