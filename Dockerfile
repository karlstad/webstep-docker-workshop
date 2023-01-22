FROM node:18.13-bullseye-slim AS builder

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

FROM node:18.13-alpine

WORKDIR /app

COPY --from=builder /app/build build

ENV PORT=8080

RUN addgroup --gid 1005 somegroup \
  && adduser --uid 1006 --ingroup somegroup --disabled-password --shell /bin/false someuser

USER someuser

CMD [ "npx", "--yes", "serve", "build" ]
