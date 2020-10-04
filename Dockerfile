FROM ruby:2.3.1-alpine

ENV APP_HOME /app

RUN apk add --update --no-cache \
      binutils-gold \
      bash \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata


RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
#COPY package.json yarn.lock ./
#RUN yarn install --check-files

COPY . $APP_HOME

#RUN npm install -g yarn
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["bash","entrypoint.sh"]

EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]