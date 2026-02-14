# Use Node.js 20 Alpine base image for small size and compatibility
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the repo into the container
COPY . .

# Set the command to run the Worker
CMD ["npm", "start"]


