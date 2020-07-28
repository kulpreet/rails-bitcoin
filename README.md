
# Rails bitcoin address tracker

## Start the app

`docker-compose up`

### Web Application

The above will start rails application at `http://localhost:3000`


### Background jobs processor

The above will also start a redis/sidekiq background processor for
downloading transaction from blockchain info. The console for the 
background processor is available at `http://localhost:3000/sidekiq`


## Stop the app

`docker-compose down`

## Quick rebuild app 

Without changes to Gemfile, Dockerfile or package.json

`docker-compose up --build`

## Compleletely rebuild 

When changes made to above mentioned configuration files

`docker-compose run web bundle install && docker-compose up --build`


