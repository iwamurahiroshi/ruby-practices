# frozen_string_literal: true

score = ARGV[0]
split_score = score.split(',')
shots = []
split_score.each do |s|
  if s == 'X' && shots.length < 18
    shots << 10
    shots << 0
  elsif s == 'X'
    shots << 10
  else
    shots << s.to_i
  end
end

shots_per_frame = shots.each_slice(2).to_a
frame_counter = 1
total_score = 0

shots_per_frame.each do |x, y|
  total_score += x + y.to_i
  if x == 10 && frame_counter < 10
    total_score += shots_per_frame[frame_counter][0] + shots_per_frame[frame_counter][1]
    total_score += shots_per_frame[frame_counter + 1][0] if shots_per_frame[frame_counter][0] == 10 && frame_counter < 9
  elsif x + y.to_i == 10 && frame_counter < 10
    total_score += shots_per_frame[frame_counter][0]
  end
  frame_counter += 1
end
puts total_score
