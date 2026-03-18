FROM node:16-alpine

WORKDIR /app

COPY package.json ./

RUN npm config set registry https://registry.npmjs.org/ && \
    npm config set fetch-timeout 600000 && \
    npm config set fetch-retry-mintimeout 60000 && \
    npm config set fetch-retry-maxtimeout 300000 && \
    npm install --legacy-peer-deps --no-audit && \
    npm install parseqs yeast has-cors backo2 --legacy-peer-deps --no-audit

COPY . .

EXPOSE 8001

CMD ["npx", "umi", "dev"]
