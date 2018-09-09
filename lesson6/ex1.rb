require 'csv'
require 'json'


(1..12).each do |month|
  (1..31).each do |day|
    clients = CSV.read('clients.csv', headers: true).select { |x| x['Birthday'].start_with? "#{month}/#{day}" }
    File.write("#{month.to_s.size == 1 ? '0' + month.to_s : month}_#{day.to_s.size == 1 ? '0' + day.to_s : day}.json", JSON.dump(clients))
  end
end

