FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
copy . .
RUN npm run build


FROM nginx
copy --from=builder /app/build /usr/share/nginx/html

