require 'faraday'
require 'nokogiri'

resp = Faraday.get 'http://google.com'

doc = Nokogiri::HTML(resp.body)
url = doc.at('a')['href']

resp2 = Faraday.get url
puts resp2.body
