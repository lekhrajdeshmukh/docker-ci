FROM node:alpine as alphagroup
WORKDIR /var/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=alphagroup /var/app/build /usr/share/nginx/html