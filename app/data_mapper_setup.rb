env = ENV["RACK_ENV"] || "development" # defaulting to devopment
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}") # select database for enviro
DataMapper.finalize
DataMapper.auto_upgrade!