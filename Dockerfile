FROM node:latest

WORKDIR /app

COPY ./package*.json ./
RUN npm install

COPY . .

EXPOSE 80 443

CMD [ "node", "server.js" ]
