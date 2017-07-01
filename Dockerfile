FROM mhart/alpine-node:6
MAINTAINER "Manojvv" "manojrpms@gmail.com"
RUN apk update \
    && apk add unzip
RUN adduser -u 1001 -h /home/sunbird/ -D sunbird
WORKDIR /home/sunbird
COPY player-dist.zip  /home/sunbird/
RUN unzip /home/sunbird/player-dist.zip \ 
    && chown -R sunbird:sunbird /home/sunbird
WORKDIR /home/sunbird/dist
RUN npm install express-http-proxy --save \
    && npm install express --save \
    && npm install request --save
EXPOSE 80
CMD ["node", "server.js", "&"]
