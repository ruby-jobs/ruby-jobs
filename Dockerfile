FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y curl wget bundler vim git libmysqlclient15-dev nodejs build-essential libpq-dev libv8-dev libsqlite3-dev

RUN mkdir /tmp/ruby && cd /tmp/ruby &&  \
    wget http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz && \
    tar -vzxf ruby-2.3.1.tar.gz && \
    cd ruby-2.3.1 && \
    ./configure --disable-install-rdoc --prefix=/usr/local --enable-shared --disable-install-doc --with-opt-dir=/usr/local/lib --with-openssl-dir=/usr --with-readline-dir=/usr --with-zlib-dir=/usr && \
    make && \
    make install && \
    rm -rf /tmp/ruby

RUN gem install bundler

RUN mkdir -p /app
WORKDIR /app

EXPOSE 3000

ADD . /app/.
RUN bundle install
RUN overcommit --install
