FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm install -g http-server
COPY /etc/letsencrypt/live/encuestadores.cristianayala.cl/privkey.pem /usr/src/app
COPY /etc/letsencrypt/live/encuestadores.cristianayala.cl/fullchain.pem /usr/src/app
CMD ["http-server", "-S", "-C", "/usr/src/app/fullchain.pem", "-K", "/usr/src/app/privkey.pem"]
