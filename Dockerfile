FROM caddy:alpine

# Instalar NodeJS y NPM
RUN apk update && apk add --no-cache nodejs npm

WORKDIR /

COPY packaje*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN cp -r dist/* /srv/

COPY ./Caddyfile /etc/caddy/Caddyfile