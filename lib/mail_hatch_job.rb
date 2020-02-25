class MailHatchJob < ActiveJob::Base
  queue_as :mailers

  def perform(mail_hatch, method_name, args)
    mail_hatch.send(method_name, args)
  end
end