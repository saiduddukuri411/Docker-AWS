#tagged the below phase as builder since we need to build ngnix phase as well
FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build 

#config for run phase of nginx
FROM nginx

#copy build file from above builder config to predenied ngnix path
  #no need to mention any CMD to run ngnix will automatically start serverfor us
COPY --from=builder /app/build /usr/share/nginx/html











