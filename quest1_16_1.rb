# ブラックジャックゲーム　ステップ1

# トランプカードを生成
suits = ["スペード", "ハート", "クラブ", "ダイヤ"]
ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
cards = suits.product(ranks).map{|suit, rank| "#{suit}の#{rank}"}


# カードの点数化
def card_score(card)
    # 配列cardsを「の」を区切り文字として、suitとrankとして格納する。
    suit, rank = card.split("の")
    case rank
    when "J", "Q", "K"
        10
    when "A"
         1
    else
        rank.to_i
    end
end

# 開始宣言
puts "ブラックジャックを開始します。"


# cardsからカードをランダムに配る
def draw(cards)
    select_card = cards.sample

    cards.delete(select_card)
    # puts "選択されたカード：#{select_card}"
    # puts "残りのカード：#{cards}"
    select_card
end


    

# プレイヤーとディーラーにカードを配る　【懸念事項】このコードで、配列cardsの中から、今回配られた4枚のカードがちゃんと消えているだろうか。
player_hand = [draw(cards), draw(cards)]
dealer_hand = [draw(cards), draw(cards)]

# 配られた2枚のカードを点数化　
player_score = player_hand.map{ |card| card_score(card) }.sum
dealer_score = dealer_hand.map{ |card| card_score(card) }.sum

# 配られたカードを表示
puts "あなたの引いたカードは、#{player_hand[0]}です。"
puts "あなたの引いたカードは、#{player_hand[1]}です。"
puts "ディーラーの引いたカードは、#{dealer_hand[0]}です。"
puts "ディーラーの引いた2枚目のカードは、あなたには分かりません。"

# 現在の点数を表示
puts "あなたの現在の得点は#{player_score}点です。"


# プレイヤーのターン
loop do
    puts "カードを引きますか？ (Y / N)"
    response = gets.chomp.upcase

    if    response == "Y"
            draw_card = draw(cards)
            player_hand << draw_card
            player_score += card_score(draw_card)
            puts "あなたが引いたカードは、#{draw_card}です。"
            puts "あなたの現在の得点は、#{player_score}です。"
    elsif response == "N"
            break
    else
            puts "無効な入力です。YまたはNで答えてください。"
    end

    if    player_score > 21
            puts "あなたが引いたカードは#{draw_card}です。"
            puts "GAMEOVER... あなたの得点が21点を超えました。"
            break
    end
end


# ディーラーのターン
puts "ディーラーの引いた2枚目のカードは、#{dealer_hand[1]}でした。"
puts "ディーラーの現在の得点は、#{dealer_score}点です。"
loop do
    if    dealer_score < 17
            draw_card = draw(cards)
            dealer_hand << draw_card
            dealer_score += card_score(draw_card)
            puts "ディーラーが、今引いたカードは、#{draw_card}です。"
    elsif dealer_score >= 17
            break
    else
            puts "ディーラーが、今引いたカードは#{draw_card}です。"
            puts "GAMEOVER... ディーラーの得点が21点を超えました。"
            break
    end
end


# 結果発表
puts "あなたの得点は、#{player_score}点です。"
puts "ディーラーの得点は、#{dealer_score}点です。"
if    player_score > 21 && dealer_score > 21
        puts "両者とも得点が21点を超えたため、失格です！"     
elsif player_score > 21
        puts "あなたの得点が21点を超えたため、ディーラーの勝ちです！"
elsif dealer_score > 21
        puts "ディーラーの得点が21点を超えたため、あなたの勝ちです！"
elsif player_score > 21 && dealer_score > 21
        puts "両者とも得点が21点を超えたため、失格です！" 
elsif player_score > dealer_score
        puts "あなたの勝ちです！"
elsif player_score < dealer_score
        puts "ディーラーの勝ちです！"
elsif player_score == dealer_score
        puts "引き分けです！"
end


# 終了宣言
puts "ブラックジャックを終了します。"
