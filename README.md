# Calendrob for Calendly
The Calendrob API allows users to subscribe to Calendly API events and send text messages with event information when an invitee books a meeting.

## Where I Would Go Next
Before we get into installation, let's talk about what I would add with more time: 
1. **Dynamically pull a publisher's phone number.** I ran out of time to configure this, so it is hardcoded to send to my phone number. The Twilio trial only allows you to text your own number, so I still would not have *consumed* the publisher's phone number dynamically (yet). 
1. **Dynamically set the sender's phone number.** I only have one Twilio number in the trial, but it would be nice if the consumer could configure their phone number. Or even better...
1. **A UI to choose the sender phone number.** from your available Twilio numbers.
1. **More testing.** I enjoy TDD, and I included several tests. But I did skip some edge case testing in the interest of time.
1. And other various ideas, such as configuring text messages per Calendly event type, a UI to see all invitee_created events and the text that sent out as a result, etc.

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

Since we're running this locally, we need to expose our local web app to the interwebs out there so that Calendly's API can talk to our webhook. There's various ways of doing this; I personally prefer [creating a secure tunnel with NGrok](https://ngrok.com/).
* Download NGrok.
* Start NGrok: `ngrok http 3000`. You'll see an .ngrok.io subdomain. Set this to the URL in your webhook subscription.
* NGrok Pro offers static URLs if you desire.

## Test Suite
Run the test suite: `rspec` (or `bundle exec rspec`, if you prefer).

The test suite is written using the RSpec framework. FactoryBot is the factory provider (see `spec/factories`), and a handful of JSON fixtures are also used (in `spec/fixtures`).
