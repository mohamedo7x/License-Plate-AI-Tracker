FROM node:22

WORKDIR /usr/src/app

#copy every thing from this dir to docker image 

COPY . . 

RUN npm install 

EXPOSE 3000

CMD ["npm","run","start:dev"]