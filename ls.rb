# frozen_string_literal: true

def all_files_directory
  Dir.glob('*') # ディレクトリのファイル取得
end

def files_array
  all_files = all_files_directory
  div_filecount = (all_files.size / COLUMN.to_f).ceil(0) # 縦何行まで表示するか
  array_files = all_files.each_slice(div_filecount).to_a # 必要行数で分割
  if array_files.size == 1 #ファイルが一つの時の挙動
    array_files
  else
    array_files.inject(&:zip).map(&:flatten) # zipで縦横転置, flattenで配列を平坦化
  end
end

def ls_output
  files_array.each do |files|
    unless_nil_file = files.compact # nil削除
    file_line = unless_nil_file.sum('') { |one_of_file| one_of_file.ljust(16) } # ファイル間隔統一
    print file_line
    puts
  end
end

COLUMN = 3 # 指定行
ls_output