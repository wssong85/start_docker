FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

ENV PORT=80

FROM nginx
EXPOSE port $PORT
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

#