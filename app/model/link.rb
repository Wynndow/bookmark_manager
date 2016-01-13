require 'data_mapper'
require 'dm-postgres-adapter'

class Link

  include DataMapper::Resource

  property :id,     Serial
  property :url,    String
  property :title,  String

end

DataMapper.setup(:default, "postgres://localhost/lab_week_bookmark_manager_#{ENV['RACK_ENV']}" || 'postgres://cmitoqheurssgb:PgLjfqxtV-ed1DSK5q7y6PQEMo@ec2-107-21-120-109.compute-1.amazonaws.com:5432/d9rj9agucqdrog' )
DataMapper.finalize
DataMapper.auto_upgrade!
