# frozen_string_literal: true

files = Dir.glob('*')

column = 3
extra = files.length % column
(column - extra).times do
  files << nil
end
sliced_files = files.each_slice(files.length / column).to_a
longest_word_per_column = sliced_files.map { |x| x.max_by { |y| y.to_s.length } }
longest_wordsize_per_column = longest_word_per_column.map(&:length)
transposed_files = sliced_files.transpose
transposed_files.each do |files_per_column|
  files_per_column.each.with_index(1) do |file, i|
    if i == column
      puts file&.ljust(longest_wordsize_per_column[i - 1] + 3)
    else
      print file&.ljust(longest_wordsize_per_column[i - 1] + 3)
    end
  end
end
