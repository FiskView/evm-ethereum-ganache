FROM node:20-alpine

WORKDIR /app

RUN npm install -g truffle \ && npm config set bin-links false \ && npm cache clean --force

COPY package.json ./

RUN npm install \ && npm cache clean --force

COPY contracts ./contracts
COPY migrations ./migrations
COPY truffle-config.js ./truffle-config.js

CMD [ "truffle", "compile" ]