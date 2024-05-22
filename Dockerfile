FROM docker.io/library/ubuntu:latest

RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y nodejs npm
RUN npm install -g @angular/cli

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN ng build --prod

