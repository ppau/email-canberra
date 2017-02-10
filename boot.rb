# gems
require "bundler/setup"
require "pony"
require "json"
require "sinatra"
require "curb"

#standard library
require "fileutils"

if File.foreach("config.ini").grep(/api = true/)
  require "./app/api/api.rb"
  puts "Starting api"
end

if File.foreach("config.ini").grep(/app = true/)
  require "./app/app/app.rb"
  puts "Starting app"
end
