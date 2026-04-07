# ---- Build Stage ----
# TODO: Complete this multi-stage Dockerfile
# Stage 1: Build the static assets
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Serve with nginx
# TODO: Add non-root user configuration
FROM nginx:alpine

# TODO: Create a non-root user
# RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/build /usr/share/nginx/html

# TODO: Add custom nginx.conf for proper SPA routing
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# TODO: Switch to non-root user
# USER appuser

CMD ["nginx", "-g", "daemon off;"]
