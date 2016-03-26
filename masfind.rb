#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'
require 'open-uri'

search = "Xcode"
limit = 30
url = "http://itunes.apple.com/search?entity=macSoftware&limit=" + limit + "&term=" + search

open(url) do |f|
  json = f.read
end

#json = File.read('sparrow.json')
obj = JSON.parse(json)

#pp obj['resultCount']

if (obj['resultCount'] != 0)
	obj['results'].each do |app|
		puts app["trackId"].to_s << " " << app["trackName"] << " (" << app["version"] << ")"
	end
end
