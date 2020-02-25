# Mail Hatch

:fire: Send stunning emails in minutes.

Battle-tested email designs for every need - accessed, configured, and sent through a developer-minded API.

[https://www.mailhatch.io](https://www.mailhatch.io)

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

## Active Job

Uses the `:default` queue.

## Usage

