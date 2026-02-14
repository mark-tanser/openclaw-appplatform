# Use Node 20 Alpine
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the app
COPY . .

# Ensure openclaw is installed globally
RUN npm install -g openclaw

# Run OpenClaw
CMD ["openclaw", "gateway", "start"]

