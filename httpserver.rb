#!/usr/bin/env ruby

require 'webrick'
include WEBrick

s = HTTPServer.new(
  :Port => 8000,
  :DocumentRoot => File.join(Dir::pwd),
  :BindAddress => '0.0.0.0'
)
trap("INT"){ s.shutdown }
s.start
