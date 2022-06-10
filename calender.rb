require "date" #dateを取得
today = Date.today #本日の日付データを取得する変数
def calender(year: Date.today.year, month: Date.today.month)
  first_day = Date.new(year, month, 1) #現在の月の初日を定義、年月は現在の適用
  last_day = Date.new(year, month, -1) #現在の月の最終日を定義、年月は現在のを適用
  puts "#{year} #{month}月".center(20) #現在の年月を取得し表示

  days_week = ("日 月 火 水 木 金 土")
  puts days_week #カレンダーように曜日を一定間隔で表示
  start_wday = "   " * first_day.wday #１日の曜日の数値分、空白を作成する
  wday_num = first_day.wday #現在の月の１日の曜日を数値化する
  print start_wday

(1..last_day.day).each do |date| #last_dayのみだと年月も含まれるのでエラー
    print date.to_s.rjust(2) + " " #１から最終日までの数字を文字列に変更し、空白を追加
    wday_num = wday_num + 1 #曜日の数値に１を足していく
    puts if wday_num % 7 == 0 #曜日の数値が7つまり土曜日の場合、改行する #trueの時に改行を行う
  end
  puts "" #最終日に改行をつけ足し終了
end

require "optparse" #-y,-mなどのオプションをつけたいので取得

def opt_parse
  params={}
  opt = OptionParser.new
  opt.on("-m ", "--month ") {|v| params[:month] = v.to_i } #onメソッドで-mのオプションを設定
  opt.on("-y ", "--year ") {|v| params[:year] = v.to_i } #onメソッドで-yのオプションを設定
  #onメソッドは呼ばれただけでは実行されずに登録されるのみ
  opt.parse!(ARGV)
  params
end

puts calender(**opt_parse) #parseした値を関数calenderに返す