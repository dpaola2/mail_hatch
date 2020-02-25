class MailHatch
  attr_reader :api_key,
    :brand_color, 
    :debug, 
    :dry_run,
    :sendgrid_api_key,
    :title,
    :address,
    :ios_store_url,
    :google_play_store_url

  def initialize(api_key:,brand_color:,debug: false, dry_run: false, sendgrid_api_key:, title:, address:, ios_store_url:, google_play_store_url:)
    @api_key = api_key
    @title = title
    @address = address
    @brand_color = brand_color
    @debug = debug
    @dry_run = dry_run
    @ios_store_url = ios_store_url
    @google_play_store_url = google_play_store_url
    @sendgrid_api_key = sendgrid_api_key
  end

  def async_notification(to:, from:, text:, subject:)
    async(:notification, {to: to, from: from, text: text, subject: subject})
  end

  def notification(to:, from:, text:, subject:)
    body = {
      api_key: api_key,
      sendgrid_api_key: sendgrid_api_key,
      to: to,
      from: from,
      text: text,
      template: "notification", 
      theme: "minimal",
      subject: subject,
      data: {
        ios_store_url: ios_store_url,
        google_play_store_url: google_play_store_url,
        message: text,
        title: title,
        address: address,
      },
      design: {
        brand_color: brand_color
      }
    }

    post(body)
  end

  private

  def async(method_name, args)
    MailHatchJob.perform_later(self, method_name, args)
  end

  def post(body)
    if debug
      pp "MailHatch URL: #{url}"
      puts "Headers:"
      puts JSON.pretty_generate(headers)
      puts "Body:"
      puts JSON.pretty_generate(body)
    end
    
    if dry_run
      "Dry Run"
    else
      resp = HTTParty.post(url, headers: headers, body: body.to_json)

      raise MailHatchError.new(resp["message"]) if resp["status"] != 200

      resp
    end
  end

  def headers
    {"Content-Type": "application/json"}
  end

  def url
    "https://api.mailhatch.io/api/v1/send"
  end
end

require 'mail_hatch_error'
require 'mail_hatch_serializer'
require 'mail_hatch_job'