require 'open-uri'

puts "jp.teuters.comのurlを入力してください"
url = gets.chop
page = URI.open(url, &:read)

title = page.scan(%r!<title>(.+?)</title>!)
puts "タイトル: #{title[0][0]}"


dates = page.scan(%r!<meta property="og:article:published_time" content="(.+?)"\/>!)
#直接値が取れなかったので成形しなおす
time = Time.parse(dates[0][0]).getlocal("+09:00").strftime("%Y年%m月%d日 / %H:%M")
puts "日時: #{time}" 

text = page.scan(%r!<p class="Paragraph-paragraph-2Bgue ArticleBody-para-TD_9x">(.+?)<\/p>!)
print "本文: "
text.each do |t|
    puts "#{t[0]}"
end