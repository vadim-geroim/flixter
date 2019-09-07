# README

This README document steps are necessary to get the application up and running.

## Precondition 
* Ruby version 2.5.3 installed
* Ruby on Rails version 5.2.3 installed

## Configuration
To get started with the app, clone the repo and then install the needed gems:
````
bundle install --without production
````

## Database creation and initialization
Next, migrate the database:
````
rails db:migrate
````

## Services (job queues, cache servers, search engines, etc.)
Run the app in a local server:
````
rails server
````

## Deployment instructions
Following instructions for Heroku:

* Login to your Heroku account
````
heroku login
````
* Create Heroku app
````
heroku create your_app_name
````
* Deploy an application
````
git push heroku master
````
* Initialize database
````
heroku run rails db:migrate
heroku restart
````
* The application should be up and running
