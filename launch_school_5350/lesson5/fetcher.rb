# $ ruby fetcher.rb
# Please enter a URL:
# https://www.airbnb.co # entered by the user
# Retrieved https://www.airbnb.com with a status of 200.
# Size: 106721 bytes.
# Title: Vacation Rentals, Homes, Apartments & Rooms for Rent - Airbnb.

require 'faraday'
require 'nokogiri'

puts 'Please enter a URL:'
url = gets.strip

if url !~ /\Ahttp/
  puts 'bad URL'
  exit
end

begin
  resp = Faraday.get url

  resp = Faraday.get resp.headers['location'] if resp.status == 301 || resp.status == 302

  if resp.success?
    puts "Retrieved #{url} with a status of #{resp.status}."
    puts "Size: #{resp.body.size} bytes"
    puts "Title: #{resp.body[/<title>(.*)<\/title>/, 1]}"
  else
    puts "Received a status code of #{resp.status}."
    exit
  end
rescue
  puts 'error'
ensure
  exit
end
