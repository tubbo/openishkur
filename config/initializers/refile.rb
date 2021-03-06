if defined? Refile::S3
  aws = {
    access_key_id: Rails.application.secrets.aws_access_key_id,
    secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: Rails.application.secrets.aws_region,
    bucket: Rails.application.secrets.s3_bucket_name
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
