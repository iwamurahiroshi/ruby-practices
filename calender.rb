#!/usr/bin/env ruby

require "optparse"
require "date"

entered_date = ARGV.getopts("y:m:")
todays_date = Date.today
entered_year = entered_date["y"]&.to_i || todays_date.year
entered_month = entered_date["m"]&.to_i || todays_date.month
first_day = Date.new(entered_year, entered_month, 1)
last_day = Date.new(entered_year, entered_month, -1)
number_of_days = (first_day..last_day)

puts "      " + "#{entered_month}月" + " " + "#{entered_year}"

days_of_the_week = ["日", "月", "火", "水", "木", "金", "土"]
puts days_of_the_week.join(" ")
	
first_day.wday.to_i.times{print" ".rjust(2) + " "}
number_of_days.each do |a_day|
  if a_day.saturday?
    puts a_day.day.to_s.rjust(2) + " "
  else
    print a_day.day.to_s.rjust(2) + " "
  end
end
puts