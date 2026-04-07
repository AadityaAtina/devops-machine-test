# ---- Build Stage ----
# TODO: Candidate must complete this multi-stage Dockerfile
# Stage 1: Install dependencies
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# Stage 2: Production image
# TODO: Use a non-root user for security
FROM node:18-alpine
WORKDIR /app

# TODO: Create a non-root user and switch to it
# RUN addgroup -S appgroup && adduser -S appuser -G appgroup
# USER appuser

COPY --from=builder /app/node_modules ./node_modules
COPY . .

EXPOSE 3000

# TODO: Add a HEALTHCHECK instruction
# HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://localhost:3000/health || exit 1

CMD ["node", "src/server.js"]
