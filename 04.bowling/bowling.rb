# frozen_string_literal: true

score = ARGV[0]
split_score = score.split(',')
score_exchanged_integer = []
split_score.each do |s|
  if s == 'X' && score_exchanged_integer.length < 18
    score_exchanged_integer << 10
    score_exchanged_integer << 0
  elsif s == 'X'
    score_exchanged_integer << 10
  else
    score_exchanged_integer << s.to_i
  end
end

score_per_frame = []
score_exchanged_integer.each_slice(2) do |x|
  if score_per_frame.length == 10
    score_per_frame[9] << x[0]
  else
    score_per_frame << x
  end
end

total_score = 0
score_per_frame.each.with_index(1) do |shots, frame|
  total_score +=
    if frame < 9 && shots[0] == 10 && score_per_frame[frame][0] == 10
      shots.sum + score_per_frame[frame][0] + score_per_frame[frame + 1][0]
    elsif frame < 10 && shots[0] == 10
      shots.sum + score_per_frame[frame][0] + score_per_frame[frame][1]
    elsif frame < 10 && shots.sum == 10
      shots.sum + score_per_frame[frame][0]
    else
      shots.sum
    end
end
puts total_score
