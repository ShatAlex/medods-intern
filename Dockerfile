FROM ruby:3.0.2

WORKDIR /rails

COPY . .

COPY Gemfile Gemfile.lock ./
RUN bundle install

RUN apt-get update && apt-get install -y \
    postgresql-client

EXPOSE 3000
CMD ["./bin/rails", "s"]

