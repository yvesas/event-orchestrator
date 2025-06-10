FROM node:18-alpine

WORKDIR /usr/src/app
RUN apk add --no-cache netcat-openbsd
COPY package*.json ./
RUN npm install
COPY . .

RUN chmod +x scripts/init.sh

EXPOSE 3000
CMD ["sh", "./scripts/init.sh"] 