class Judge
 attr_reader :player, :dealer, :cpu1, :cpu2

 def initialize(player, dealer, cpu1, cpu2)
   @player = player
   @dealer = dealer
   @cpu1 = cpu1
   @cpu2 = cpu2
 end

 # 勝敗を判定する
 def win_or_lose
   max_total = 0
   winner = []

   [@player, @dealer, @cpu1, @cpu2].each do |allplayer|
    total = allplayer.hand.calculate_hand_total
 
     if total <= 21  # 修正点: 21点以下の場合に winner 配列に要素を追加
       if total > max_total
         max_total = total
         winner = [allplayer]
       elsif total == max_total
         winner << allplayer
       end
     end
   end  



   if [@player, @dealer, @cpu1, @cpu2].all? { |allplayer| allplayer.hand.calculate_hand_total > 21 }  # 修正点: 全員が21点を超えた場合
     "全員失格です！"
   elsif winner.size == 3  # 4人中3人が同点だった場合
     "#{winner[0].play_name}と#{winner[1].play_name}と#{winner[2].play_name}の勝ちです！"
   elsif winner.size == 2  # 4人中2人が同点だった場合
     "#{winner[0].play_name}と#{winner[1].play_name}の勝ちです！"
   elsif winner.size == 1
     "#{winner[0].play_name}の勝ちです！"
   else
     "全員引き分けです！"
   end
 end

 # 勝敗を文字列で表示する
 def to_s
   win_or_lose
 end
end