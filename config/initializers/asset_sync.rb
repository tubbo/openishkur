if defined? AssetSync
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.aws_access_key_id = Rails.application.secrets.aws_access_key_id
    config.aws_secret_access_key = Rails.application.secrets.aws_secret_access_key
    config.fog_directory = Rails.application.secrets.s3_bucket_name
    config.cdn_distribution_id = Rails.application.secrets.cloudfront_distro_id
    config.fog_region = Rails.application.secrets.aws_region
    config.invalidate = ['application.js', 'application.css']
    config.gzip_compression = true
    config.manifest = true
    config.fail_silently = true
  end
end
