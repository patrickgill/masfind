#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'
require 'open-uri'

search = "Xcode"
url = "http://itunes.apple.com/search?entity=macSoftware&limit=50&term=" + search

#open(url) do |f|
#  page_string = f.read
#end

json = File.read('sparrow.json')
obj = JSON.parse(json)

#pp obj['resultCount']

if (obj['resultCount'] != 0)
	obj['results'].each do |app|
		puts app["trackId"].to_s + " " + app["trackName"]
	end
end
