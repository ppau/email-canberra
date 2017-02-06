require "fileutils"
require "bundler/setup"
require "json"
require "sinatra"

if File.foreach("config.ini").grep(/api = true/)
  puts "Starting api"
  require "./app/api/api.rb"
end

if File.foreach("config.ini").grep(/app = true/)
  puts "Starting app"
  require "./app/app/app.rb"
end
