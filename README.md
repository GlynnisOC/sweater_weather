Designed to showcase building API endpoints, authenticate users utilizing bcrypt and assigning randomly-generated API keys to them upon account creation, consume multiple API's, and the ability to push to production on Heroku. 

Built using Rails 5.2.3, Ruby 2.5.1, and a PostgreSQL database. To run locally, ```git clone git@github.com:GlynnisOC/sweater_weather.git``` ```bundle``` ```bundle exec figaro install``` to set your API keys from Google Geocode & Directions, Darksky, and Unsplash as environment variables in config/application.yml. 
```DARKSKY-API-KEY: <YOUR-DARKSKY-API-KEY>``` and so on for the resulting API's used in this application.

After all of your API keys have been added, install rspec by executing ```bundle exec rspec install``` and configure your database with ```bundle exec rails db:{create,migrate}``` To run the test suite, simply execute ```bundle exec rspec``` In order to view the JSON API 1.0 compliant endpoints, fire up a local server with ```rails s```and access them in Postman or at localhost:3000.
