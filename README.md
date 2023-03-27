
# Beezen API

This is a Ruby on Rails project created for Beezen selection following these requirements:
* JSON api to list alerts
* JSON api to create alerts
* Alerts dashboard
* All pages should be authenticated
* Only alerts of type "portal_opened" and "portal_closed" should be created

Things you may want to know to run it:

* Ruby 3.2.1
* Rails 7.0.4

## First steps
Run `bundle` to install all needed gems to start running the application.
Also gotta build the css and js assets (for the dashboard):
`rails css:build`
`rails javascript:build`

Use `rails s` to start the server.

## Database
To create and populate the database, use:
`rails db:create`
`rails db:migrate`
`rails db:seed`

Seeding will create sample alerts and a sample user with the following credentials:
E-mail: `admin@beezenapi.com`
Password: `password12`

Use this user to log into the dashboard or use it to authenticate on the API.
There is no other way to signing up apart from creating the user through Rails console or inserting it into sqlite database (thought it wouldn't make sense to allow users sign up on a dashboard with *sensitive* data.


## Using the API
### Sign in
POST request to /api/users/sign_in with this json body:
```
{
	"email": "admin@beezenapi.com",
	"password": "password12"
}
```
The response will include in its headers these two keys:
* Access-Token (which will be used on all other requests, keep this)
* Expire-at (so you know when your token is going to expire)

### Listing alerts
GET request to /api/alerts with the access token in its header Authorization.
You have to insert into header:
`Authorization` key with value `Bearer #{INSERT Access-Token HERE}`
It is going to return an array of json objects listing all the existing alerts.

### Creating alerts
POST request to /api/alerts with the access token in its header Authorization.
You have to insert into header:
`Authorization` key with value `Bearer #{INSERT Access-Token HERE}`
The JSON body should look like this:
```
{
	"type": "portal_opened",
	"description": "A portal was opened",
	"tag": ["version3.8.9", "production"],
	"origin": "127.0.1.1"
}
```
*(this was the sample payload mentioned in requirements)*
Bear in mind that the alert will only be created if the type is either "portal_opened" or "portal_closed" *(also a requirement)*.

### Token refreshing

As for now, there is no access token refreshing.
Whenever your access token expires, you're required to login with your credentials again to get a new access token.
