require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './model/link.rb'
require_relative './model/tag.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/lab_week_bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
