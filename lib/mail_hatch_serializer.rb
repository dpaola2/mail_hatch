class MailHatchSerializer < ActiveJob::Serializers::ObjectSerializer
  def serialize?(argument)
    argument.is_a? MailHatch
  end

  def serialize(mh)
    super(
      api_key: mh.api_key,
      brand_color: mh.brand_color,
      debug: mh.debug, 
      dry_run: mh.dry_run,
      sendgrid_api_key: mh.sendgrid_api_key,
      title: mh.title,
      address: mh.address,
      ios_store_url: mh.ios_store_url, 
      google_play_store_url: mh.google_play_store_url
    )
  end

  def deserialize(hash)
    mh = OpenStruct.new(hash)
    MailHatch.new(
      api_key: mh.api_key,
      brand_color: mh.brand_color,
      debug: mh.debug, 
      dry_run: mh.dry_run,
      sendgrid_api_key: mh.sendgrid_api_key,
      title: mh.title,
      address: mh.address,
      ios_store_url: mh.ios_store_url, 
      google_play_store_url: mh.google_play_store_url
    )
  end
end