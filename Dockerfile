ARG NODE_VERSION

FROM node:${NODE_VERSION} as app-deps
WORKDIR /app
ADD package.json .
RUN npm install --quiet;

FROM node:${NODE_VERSION}
ENV PORT 8080
ENV MONGO_URL mongodb://localhost:27017/quotes
EXPOSE 8080
WORKDIR /app
ADD . /app
COPY --from=app-deps /app/node_modules node_modules
ENTRYPOINT npm start
