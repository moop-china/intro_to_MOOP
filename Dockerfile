FROM mhart/alpine-node

MAINTAINER wangz longwind.wang@gmail.com

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN npm install -g gitbook-cli && gitbook install 3.2.3

# Install latest version

RUN mkdir /gitbook && \
    cd /gitbook && \
    git clone https://github.com/moop-china/intro_to_MOOP.git &&\
    cd intro_to_MOOP && \
    gitbook install

WORKDIR /gitbook/intro_to_MOOP

EXPOSE 4000

CMD ["gitbook", "serve", "/gitbook/intro_to_MOOP"]



