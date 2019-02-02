FROM ruby:2.3.1-slim

RUN apt-get update
RUN apt-get install -y curl wget bundler vim git libmysqlclient15-dev nodejs build-essential libpq-dev libv8-dev libsqlite3-dev

RUN gem install bundler

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

ADD . /app/.
RUN overcommit --install

EXPOSE 3000
CMD [ "rails", "server" ]