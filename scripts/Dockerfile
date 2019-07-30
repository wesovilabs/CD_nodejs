ARG NODE_VERSION

FROM node:${NODE_VERSION} as app-deps
WORKDIR /app
ADD package.json .
RUN npm install --quiet;

FROM node:${NODE_VERSION}
EXPOSE 8080
WORKDIR /app
COPY --from=app-deps /app/node_modules node_modules
RUN npm install nodemon -g
