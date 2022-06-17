# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',') # ,で各種配列を分ける
shots = scores.map { |n| n == 'X' ? 10 : n.to_i } # 配列を取り出していきXは10に変換、それ以外は整数に変換

frames = [] # 1~10までのフレーム
frame = [] # 各フレーム内の内容
shots.each do |n|
  frame << s # １フレームに配列を加える

  if frames.size < 10 # 10フレームまで１フレーム2投
    if frame.size >= 2 || n == 10 # ストライクの時または1フレームに2つ以上含まれた時
      frames << frame.dup # フレーム内の数字のコピーを1~10までのフレームに加える
      frame.clear # フレーム内をリセットする
    end
  else # 10フレームのみ
    frames.last << n
  end
end

calc_score = 0 # スコア
(0..9).each do |a|
  frame, next_frame, next2_frame = frames.slice(a, 3)
  next_frame ||= [] # next_frameが存在しない場合[]を代入
  next2_frame ||= [] # afeter_next_frameが存在しない場合に[]を代入
  next_shots = next_frame + next2_frame # leftshotsは次の2回の投球
  if frame[0] == 10 # ストライクのとき
    calc_score += frame.sum + next_shots.slice(0, 2).sum # 次の2等を加算する
  elsif frame.sum == 10 # スペアの時
    calc_score += frame.sum + next_shots.fetch(0) # 次の２等の先頭を加算
  else
    calc_score += frame.sum # 通常フレームの時
  end
end
puts calc_score
