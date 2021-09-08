# frozen_string_literal: true

files = Dir.glob('*')
column = 3
extra = files.length % column
(3 - extra).times do
  files << nil
end

sliced_files = files.each_slice(files.length / column).to_a
longest_word_per_column = sliced_files.map { |x| x.max_by { |y| y.to_s.length } }
longest_wordsize_per_column = longest_word_per_column.map(&:length)

transposed_files = sliced_files.transpose
transposed_files.each do |file|
  print file[0].ljust(longest_wordsize_per_column[0] + 5)
  print file[1].ljust(longest_wordsize_per_column[1] + 5)
  puts file[2]&.ljust(longest_wordsize_per_column[2] + 5)
end
