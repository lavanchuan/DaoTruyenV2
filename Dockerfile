FROM node:20 AS build

WORKDIR /app

COPY package*.json ./

RUN npm start

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]