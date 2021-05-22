FROM ruby:2.7.0-slim

ENV RAILS_ENV production

RUN mkdir -p /app \
  && apt-get update -qq \
  && apt-get install -yq apt-utils build-essential libpq-dev postgresql-client git curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle config set without 'development test' \
  && bundle install --full-index --jobs 20 --retry 5

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
