# Typically meetups happen on the same day of the week.

# - Examples:
#     the first Monday
#     the third Tuesday
#     the Wednesteenth
#     the last Thursday

# Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a
# meetup whose members realised that there are exactly 7 days that end in
# '-teenth'. Therefore, one is guaranteed that each day of the week (Monday,
# Tuesday, ...) will have exactly one date that is named with '-teenth' in every
# month.

# Write code that calculates date of meetups.

# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule)
# where weekday is one of :monday, :tuesday, etc
# and schedule is :first, :second, :third, :fourth, :last or :teenth.

# weekday:  :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
# schedule: :first, :second, :third, :fourth, :last, :teenth


require 'date'

class Meetup
  DAYS = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }

  def initialize(month, year)
    last_day = Date.new(year, month).next_month.prev_day.mday
    @days = (1..last_day).map { |day| Date.new(year, month, day) }
  end

  def day(weekday, schedule)
    days = @days.select { |day| day.send("#{weekday}?") }
    days[DAYS[schedule]] rescue days.find { |day| day.mday.between?(13, 19) }
  end

  def day(weekday, schedule)
    days = @days.select { |day| day.send("#{weekday}?") }
    case schedule
    when :first then days.first
    when :second then days[1]
    when :third then days[2]
    when :fourth then days[3]
    when :last then days.last
    else days.find { |day| day.mday.between?(13, 19) }
    end
  end
end



require 'date'

class Meetup
  DAYS = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }

  def initialize(month, year)
    @days = *Date.new(year, month)...Date.new(year, month).next_month
  end

  def day(weekday, schedule)
    days = @days.select { |day| day.send("#{weekday}?") }
    days[DAYS[schedule]] rescue days.find { |day| day.mday.between?(13, 19) }
  end
end
