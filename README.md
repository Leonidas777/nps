# Net Promoter Score(NPS)

Net Promoter Score(NPS) is a service meant to track the user feedback given from different parts of the platform.

The solution brings the following benefits:
- the user feedback from many external services is accumulated in one place
- saving the touch point at which the user feedback was given
- introducing the unified way of tracking the user feedback about features, or important parts of the user journey
- the process of getting the feedback data is simple and straightforward.

Ruby version: 2.7.0

### System dependencies
- docker, docker-compose

### How to get it up
```
docker-compose run -rm bash
-> bundle install
-> bundle exec rake db:prepare db:test:prepare

docker-compose up
```
The service will be available on: http://localhost:3000

### How to run the tests
```
docker-compose -rm run rspec
```

### Environment variables to configure
1. `RAILS_ENV` — environment the service is run in
1. `DATABASE_URL` — DB string
