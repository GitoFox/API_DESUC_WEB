FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm install -g http-server
COPY privkey.pem .
COPY fullchain.pem .
CMD ["http-server", "-S", "-C", "/usr/src/app/fullchain.pem", "-K", "/usr/src/app/privkey.pem", "-p", "443", "-a", "0.0.0.0"]

