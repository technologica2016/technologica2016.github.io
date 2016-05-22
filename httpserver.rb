#!/usr/bin/env ruby

require 'webrick'
include WEBrick

if ARGV.length < 1 then
  puts 'binding to localhost'
  s = HTTPServer.new(
    :Port => 8000,
    :DocumentRoot => File.join(Dir::pwd)
  )
else
  puts "binding to #{ARGV[0]}"
  s = HTTPServer.new(
    :Port => 8000,
    :DocumentRoot => File.join(Dir::pwd),
    :BindAddress => ARGV[0]
  )
end

trap("INT"){ s.shutdown }
s.start
