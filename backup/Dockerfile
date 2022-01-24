FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY ../package.json .
RUN npm install
COPY .. ./
RUN npm run build

FROM nginx
EXPOSE port 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
#EXPOSE port 8081
#CMD ["nginx", "-g", "daemon off;"]