# Mail Hatch for Rails

## Add it to your Gemfile

`gem 'mailhatch-rails', require: 'mail_hatch'`

## Configuration

Put this into `config/mail_hatch.rb`:

`Rails.application.config.active_job.custom_serializers << MailHatchSerializer`

## Active Job

Uses the default queue.

## Usage

