FROM node:18.13.0-bullseye-slim AS builder

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

FROM node:18.13.0-bullseye-slim

WORKDIR /app

COPY --from=builder /app/build build

ENV PORT=8080

RUN addgroup --gid 1005 somegroup \
  && adduser --uid 1005 --gid 1005 --disabled-password --shell /bin/false someuser

USER someuser

CMD [ "npx", "--yes", "serve", "build" ]