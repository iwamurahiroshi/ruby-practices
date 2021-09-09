# frozen_string_literal: true
# 提出時は01.fizzbuzzディレクトリ外にファイルを作成し提出

x = 0
while x < 20
  x += 1
  if (x % 3).zero? && (x % 5).zero?
    puts 'FizzBuzz'
  elsif (x % 3).zero?
    puts 'Fizz'
  elsif (x % 5).zero?
    puts 'Buzz'
  else
    puts x
  end
end
