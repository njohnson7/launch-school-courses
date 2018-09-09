`ruby minion.rb`
status = $?.exitstatus

puts status == 0 ? 'it worked' : "it failed with a status of #{status}"
