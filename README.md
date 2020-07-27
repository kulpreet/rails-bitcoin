
# Rails bitcoin address tracker

## Start the app

`docker-compose up`

## Stop the app

`docker-compose down`

## Quick rebuild app 

Without changes to Gemfile, Dockerfile or package.json

`docker-compose up --build`

## Complelete rebuild 

When changes made to above mentioned configuration files

`docker-compose run web bundle install && docker-compose up --build`
