class GameFlow

  def initialize(player, dealer, cpu1, cpu2, deck)
    @player = player
    @dealer = dealer
    @cpu1 = cpu1
    @cpu2 = cpu2
    @deck = deck
  end

  def start_game
    puts "これから、ブラックジャックゲームを開始します。"
    firstcard_2
    player_turn
    cpu1_turn
    cpu2_turn
    dealer_turn
    display_score
    result_announce
    finish_game
  end
 
private
  
  def firstcard_2
    @player.draw_card(@deck, 2)
    @cpu1.draw_card(@deck, 2)
    @cpu2.draw_card(@deck, 2)
    @dealer.draw_card(@deck, 2)


    puts "#{@player.play_name}が１枚目に引いたカードは、#{@player.hand.cards[0]}です。"
    puts "#{@player.play_name}が２枚目に引いたカードは、#{@player.hand.cards[1]}です。"
    puts "#{@cpu1.play_name}が１枚目に引いたカードは、#{@cpu1.hand.cards[0]}です。"
    puts "#{@cpu1.play_name}が２枚目に引いたカードは、まだ分かりません。"
    puts "#{@cpu2.play_name}が１枚目に引いたカードは、#{@cpu2.hand.cards[0]}です。"
    puts "#{@cpu2.play_name}が２枚目に引いたカードは、まだ分かりません。"
    puts "#{@dealer.play_name}が１枚目に引いたカードは、#{@dealer.hand.cards[0]}です。"
    puts "#{@dealer.play_name}が２枚目に引いたカードは、まだ分かりません。"
  end

  def player_turn
    loop do
      puts "#{@player.play_name}の現在の得点は、#{@player.hand.calculate_hand_total}点です。"
      puts "カードを引きますか？ (Y / N)"
      response = gets.chomp.upcase
 
      if    response == "Y"
              draw_cards = @player.draw_card(@deck, 1)
              latest_draw_card = draw_cards[0]
              puts "今、#{@player.play_name}が引いたカードは、#{latest_draw_card}です。"
      elsif response == "N"
              break
      else
              puts "無効な入力です。YまたはNで答えてください。"
      end

      if    @player.hand.calculate_hand_total > 21
              puts "あなたが引いたカードは#{latest_draw_card}です。"
              puts "GAMEOVER... #{@player.play_name}の得点が21点を超えました。"
              break
      end
     end
  end

  def cpu1_turn
    puts "#{@cpu1.play_name}が２枚目に引いたカードは、#{@cpu1.hand.cards[1]}でした。"
    puts "#{@cpu1.play_name}の現在の得点は、#{@cpu1.hand.calculate_hand_total}点です。"

    loop do
      if      @cpu1.hand.calculate_hand_total < 19 # 初心者なので、GAME OVERしやすくなるように調整
                draw_cards = @cpu1.draw_card(@deck, 1)
                latest_draw_card = draw_cards[0]
                puts "今、#{@cpu1.play_name}が引いたカードは、#{latest_draw_card}です。" 
                puts "#{@cpu1.play_name}の現在の得点は、#{@cpu1.hand.calculate_hand_total}点です。"

      elsif   @cpu1.hand.calculate_hand_total > 19
                break
      end

      if      @cpu1.hand.calculate_hand_total > 21
                puts "GAMEOVER... #{@cpu1.play_name}の得点が21点を超えました。"
                break
      end
    end
  end

  def cpu2_turn
   puts "#{@cpu2.play_name}が２枚目に引いたカードは、#{@cpu2.hand.cards[1]}でした。"
   puts "#{@cpu2.play_name}の現在の得点は、#{@cpu2.hand.calculate_hand_total}点です。"

   loop do
     if      @cpu2.hand.calculate_hand_total < 17
               draw_cards = @cpu2.draw_card(@deck, 1)
               latest_draw_card = draw_cards[0]
               puts "今、#{@cpu2.play_name}が引いたカードは、#{latest_draw_card}です。" 
               puts "#{@cpu2.play_name}の現在の得点は、#{@cpu2.hand.calculate_hand_total}点です。"

     elsif   @cpu2.hand.calculate_hand_total >= 17
               break
     end

     if      @cpu2.hand.calculate_hand_total > 21
               puts "GAMEOVER... #{@cpu2.play_name}の得点が21点を超えました。"
               break
     end
   end
 end

  def dealer_turn
     puts "#{@dealer.play_name}が２枚目に引いたカードは、#{@dealer.hand.cards[1]}でした。"
     puts "#{@dealer.play_name}の現在の得点は、#{@dealer.hand.calculate_hand_total}点です。"

    loop do
      if      @dealer.hand.calculate_hand_total < 17
                draw_cards = @dealer.draw_card(@deck, 1)
                latest_draw_card = draw_cards[0]
                puts "今、#{@dealer.play_name}が引いたカードは、#{latest_draw_card}です。" 
                puts "#{@dealer.play_name}の現在の得点は、#{@dealer.hand.calculate_hand_total}点です。"

      elsif   @dealer.hand.calculate_hand_total >= 17
                break
      end

      if      @dealer.hand.calculate_hand_total > 21
                puts "GAMEOVER... #{@dealer.play_name}の得点が21点を超えました。"
                break
      end
     end
  end

  def display_score
    puts "全てのターンが終了しました。"
    puts "#{@player.play_name}の最終得点は、#{@player.hand.calculate_hand_total}点です。"
    puts "#{@cpu1.play_name}の最終得点は、#{@cpu1.hand.calculate_hand_total}点です。"
    puts "#{@cpu2.play_name}の最終得点は、#{@cpu2.hand.calculate_hand_total}点です。"
    puts "#{@dealer.play_name}の最終得点は、#{@dealer.hand.calculate_hand_total}点です。"


  end

  def result_announce
    puts Judge.new(@player, @dealer, @cpu1, @cpu2)    
  end

  def finish_game
    puts "これで、ブラックジャックゲームを終了します。"
  end
end


