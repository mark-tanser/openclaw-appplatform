# Use Node 20 Alpine as base
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy all repository files into container
COPY . .

# Install dependencies
RUN npm install --legacy-peer-deps

# Default command: start OpenClaw gateway
CMD ["npx", "openclaw", "gateway", "start"]
