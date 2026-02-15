# Use Node.js 20 Alpine
FROM node:22-alpine

# Install git (required for npm dependencies fetched via git)
RUN apk add --no-cache git

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the app
COPY . .

# Run OpenClaw setup non-interactively
RUN npx openclaw setup --mode local || true

# Run the worker
CMD ["npx", "openclaw", "gateway", "run"]


