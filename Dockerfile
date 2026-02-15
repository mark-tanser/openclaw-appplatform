# Use Node.js 20 Alpine
FROM node:22-alpine

FROM node:22-alpine

RUN apk add --no-cache git

WORKDIR /usr/src/app

COPY package.json package-lock.json* ./
RUN npm install --legacy-peer-deps --omit=dev

COPY . .

ENV NODE_ENV=production
ENV GATEWAY_MODE=local

CMD ["npx", "openclaw", "gateway", "run", "--allow-unconfigured"]



