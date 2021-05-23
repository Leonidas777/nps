# Net Promoter Score(NPS)

Net Promoter Score(NPS) is a service meant to track the user feedback given from different parts of the platform.

#### The solution brings the following benefits:
- the user feedback from many external services is accumulated in one place
- saving the touch point at which the user feedback was given
- introducing the unified way of tracking the user feedback about features, or important parts of the user journey
- the process of getting the feedback data is simple and straightforward.

### System dependencies
- docker, docker-compose

### How to get it up
Provision(only on first start):
```
docker-compose run --rm bash
-> bundle install
-> bundle exec rake db:prepare db:test:prepare DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```

Start the service:
```
docker-compose up rails
```
The service will be available on URL http://localhost:3000

### How to stop the service
Press Ctrl + C in the terminal where the service is run or open another terminal tab and execute the command:
```
docker-compose down
```

### How to run the tests
```
docker-compose run --rm rspec
```

### Main endpoints
##### Creating a feedback

Example:
```
curl --data '{"score": 10, "touchpoint": "realtor_feedback", "respondent_class": "seller", "respondent_id": 1, "object_class": "realtor", "object_id": 2}' \
  -H "Content-Type: application/json" \
  -X POST http://localhost:3000/api/v1/feedback
```

##### Getting a list of feedbacks

Example:
```
curl -H "Content-Type: application/json" \
  -X GET http://localhost:3000/api/v1/feedbacks?touchpoint=realtor_feedback&respondent_class=seller&object_class=realtor
```

### Environment variables to configure for production
1. `RAILS_ENV` — environment the service is run in
1. `DATABASE_URL` — DB string
