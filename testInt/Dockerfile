ARG NODE_VERSION

FROM node:${NODE_VERSION} as test-deps
WORKDIR /app
ADD package.json .
RUN npm install;

FROM node:${NODE_VERSION}
WORKDIR /app
COPY --from=test-deps /app/node_modules node_modules
