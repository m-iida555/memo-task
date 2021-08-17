require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"
 
memo_type = gets.to_i

if memo_type == 1 then
    puts "拡張子を除いたファイル名を入力してください。"
    file_name=gets.chomp
    
    puts"メモしたい内容を入力"
    contents=gets.to_s
    
    puts"入力後、ctrl + Dで保存"
    memo = STDIN.read
    
    
csv=CSV.open("#{file_name}.csv",'w')do |csv|
    csv << ["#{contents}"]
    csv.puts["#{memo}"]
end



elsif memo_type == 2 then
    puts "既存のメモ編集"
    puts "拡張子を除いたファイル名の入力をしてください"
    file_name=gets.chomp
    
   puts "追加で記入するメモを記載"
   contents=gets.to_s
   
   puts"記入したらCtrl+Dで上書き保存"
   memo=STDIN.read
   
   csv=CSV.open("#{file_name}.csv","a") do |sample|
       sample << ["#{contents}"]
       csv.puts ["#{memo}"]
   end
end