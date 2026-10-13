

# Stage 1: Build stage
FROM node:22-alpine AS builder

WORKDIR /app

COPY package.json ./
COPY app.js ./

# Stage 2: Runtime stage
FROM node:22-alpine AS runtime

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/app.js ./app.js

EXPOSE 3000

CMD ["npm", "start"]

