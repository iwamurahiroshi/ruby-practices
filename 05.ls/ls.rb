column = 3
difference = Dir.glob('*').length / column + 1
bigining_of_line = 0
files = Dir.glob('*')

difference.times do |x|
  print files[bigining_of_line].ljust(20)
  print files[bigining_of_line + difference].ljust(20)
  puts files[bigining_of_line + difference * 2].ljust(20) if files[bigining_of_line + difference * 2]
  bigining_of_line += 1
end
