require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください。"
  new_memo = gets.chomp

  puts "メモしたい内容を記入してください。"
  puts "完了したら Ctrl + D を押します。"

  # 入力されたファイル名でCSVファイルを作成する。
  CSV.open("#{new_memo}.csv", "w") do |memo|
    # 入力された内容をファイルに書き出す。
    memo << memo_content = readlines
  end

elsif memo_type == 2 
  puts "編集するメモのファイル名を入力してください。（拡張子を除く。）"
  edit_memo = gets.chomp

  # 指定されたCSVファイルを読み込んで表示する。
  puts "選択したメモの内容は以下になります。"
  puts CSV.read("#{edit_memo}.csv")
  puts "追加する内容を記入してください。"
  puts "Ctrl + D を押すと編集を終了できます。"
  # ファイルへの追記後に再度書き出す。
  CSV.open("#{edit_memo}.csv", "a") do |memo|
    memo << memo_content = readlines
  end
  puts "編集後のメモの内容は以下になります。"
  puts CSV.read("#{edit_memo}.csv")
else
  puts "入力できる値は１と２のみです。再度入力してください。"
end
