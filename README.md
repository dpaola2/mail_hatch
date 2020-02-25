# [Mail Hatch](https://www.mailhatch.io)

:fire: Send stunning emails in minutes.

Battle-tested email designs for every need - accessed, configured, and sent through a developer-minded API.

Tested in Production at [Jellyswitch](https://www.jellyswitch.com)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mailhatch-rails', require: 'mail_hatch'
```

And run:

```sh
bundle install
```

And restart your web server.

## Configuration

Put this into `config/initializers/mail_hatch.rb`:

```ruby
Rails.application.config.active_job.custom_serializers << MailHatchSerializer
```

## Usage

Mail Hatch is designed to be a simple replacement for your Rails mailers. First, create a Mail Hatch instance:

```ruby
mail_hatch = MailHatch.new(
  api_key: <API_KEY>,
  brand_color: "#dfdfdf",
  debug: false,
  dry_run: false,
  sendgrid_api_key: <SENDGRID_KEY>,
  ios_store_url: <IOS STORE URL>,
  google_play_store_url: <GOOGLE PLAY STORE URL>,
  title: "My Application",
  address: "My Address"
)
```

Then you can invoke any of Mail Hatch's emails. For example, to send a notification email:

```ruby
mail_hatch.notification(
  to: "foo@bar.com", 
  from: "me@me.com", 
  subject: "You have a new message", 
  text: "<message body>")
```

## Sending in the background with Active Job

1. Ensure your background job worker process is running jobs from the `:default` queue.
2. Prefix your Mail Hatch invocations with `async_`. For example: `async_notification(...)`.