# TODO: Candidate should improve this Dockerfile
# Requirements:
# - Use multi-stage build to reduce image size
# - Run as non-root user
# - Use .dockerignore to exclude node_modules
# - Pin base image to a specific digest for security

FROM node:20-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
