# Calendrob for Calendly
The Calendrob API can subscribe to Calendly API events.

## Installation
The API is built in Rails 5.2 (Ruby 2.6). It runs locally on Puma, and is backed by a SQLite database. 

1. Use your favorite Ruby version manager (asdf, rbenv, rvm) to install `Ruby 2.6.0`.
1. Clone the repository: `git clone https://github.com/undeniablyrob/calendrob.git`.
1. Install dependencies: `bundle install`.
1. Setup your database: `rake db:setup`.

## Running
Run the API locally by running `rails server` (or `rails s`). There is (currently) no authentication layer. Use your favorite API execution tool (Postman, curl, etc.) to execute.
* By default, the API runs on `http://localhost:3000`.
* Create a Calendly webhook subscription for:
    * `http://localhost:3000/webhooks/invitee_created`

## Test Suite
Run the test suite: `rspec` (or `bundle exec rspec`, if you prefer).

The test suite is written using the RSpec framework. FactoryBot is the factory provider (see `spec/factories`), and a handful of JSON fixtures are also used (in `spec/fixtures`).
