require 'csv'
require 'json'

# File.readlines(ARGV.first).each do |line|
#   fields = line.split(',')
#     ;require'pry';binding.pry;
#   [
#     fields.first,
#     fields[1],
#     fields.last
#   ]
# end



def parse_boolean(string)
  case string.strip
  when "Yes"
    true
  when "No"
    false
  end
end

def parse_hours(string)
  string = string.downcase
  week = %w(m tu w th f sa su)
  hours = {}

  string.split(";").each do |part|
    days, times = part.split(":").map(&:strip)

    next if times == "closed"
    times = times.split("-").map(&:strip)

    if days.include?("-")
      first, last = days.split("-").map { |day| week.index(day) }
      week[first..last].each do |day|
        hours[day.strip.to_sym] = times
      end
    else
      days.split(",").each do |day|
        hours[day.strip.to_sym] = times
      end
    end
  end
  hours
end

def parse_coordinates(string)
  string.tr("()", "").split(",").map { |s| Float(s) }.reverse
end

def parse_library_row(row)
  address     = format("%s\n%s, %s %s", row[:address], row[:city].capitalize, row[:state], row[:zip])
  hours       = parse_hours(row[:hours_of_operation])
  coordinates = parse_coordinates(row[:location])
  [row[:name], address, hours, coordinates]
end

def to_geo_json row
  { "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": row.last
    },
    "properties": {
      "name": row.first,
      "address": row[1],
      "hours": row[2]
    }
  }
end

csv_file = ARGV.first
fail "You must provide a CSV file to import." unless csv_file

library_rows = CSV.read(csv_file, headers: true, header_converters: :symbol)

geo_rows = library_rows.map do |row|
  # puts parse_library_row(row).inspect
  parsed_row = parse_library_row row
  to_geo_json parsed_row
end

result = {
  "type": "FeatureCollection",
  "features": JSON.load(JSON.dump(geo_rows))
}

# puts result

File.write('lib.geojson', JSON.dump(result))
