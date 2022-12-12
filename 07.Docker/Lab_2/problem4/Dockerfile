FROM node:10-alpine

WORKDIR /node/weather-app
COPY package*.json ./

RUN npm install
RUN npm install bcrypt --save

ARG application_version=1
LABEL application_version=$APP_VERSION
ENV NODE_ENV production

COPY . /var/weather-app

WORKDIR /var/weather-app

COPY . .

EXPOSE 3000
ENTRYPOINT ["./bin/www"]
CMD "npm start"