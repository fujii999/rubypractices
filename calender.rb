require "date" #dateを取得
today = Date.today #本日の日付データを取得する変数
first_day = Date.new(today.year, today.month, 1) #現在の月の初日を定義、年月は現在の適用
last_day = Date.new(today.year, today.month, -1) #現在の月の最終日を定義、年月は現在のを適用
puts "       #{today.year} #{today.month}月" #現在の年月を取得し表示

days_week = ("日 月 火 水 木 金 土") 
puts days_week #カレンダーように曜日を一定間隔で表示
start_wday = "   " * first_day.wday #１日の曜日の数値分、空白を作成する
wday_num = first_day.wday #現在の月の１地にの曜日を数値化する
print start_wday

(1..last_day.day).each do |date| #last_dayのみだと年月も含まれるのでエラー
    print date.to_s + "  " #１から最終日までの数字を文字列に変更し、空白を追加
    wday_num = wday_num + 1 #曜日の数値に１を足していく
    if wday_num % 7 == 0 #曜日の数値が7つまり土曜日の場合、改行するように作成
        print "\n" #trueの時に改行を行う
    end
end
puts "" #最終日に改行をつけたし終了