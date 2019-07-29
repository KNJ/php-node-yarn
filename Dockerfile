FROM letsdockerize/laradock-workspace:2.4-7.3

# ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 10.15.3
ENV YARN_VERSION 1.15.2

RUN apt -yq upgrade
RUN apt -yq update
RUN apt -yq install sudo npm wget php-xdebug

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN npm install n -g
RUN n $NODE_VERSION
RUN npm install -g yarn@$YARN_VERSION
RUN composer global require hirak/prestissimo
