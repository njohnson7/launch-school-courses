require 'faraday'
require 'nokogiri'

resp = Faraday.get 'https://www.flickr.com/photos/flickr/galleries/72157652879582045/?rb=1'
doc  = Nokogiri::HTML(resp.body)
doc.css('img').each { |i| puts "#{i['alt']}: #{i['src']}" }
