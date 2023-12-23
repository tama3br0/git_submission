class GamePlayer
  attr_reader :hand, :play_name

  def initialize(play_name)
    @play_name = play_name
    @hand = Hand.new
  end

  # 山札からカードを引く
  def draw_card(deck, count = 1)
    draw_cards = []  # 直近で引いたカードを格納する。
    
    # puts "Before draw: #{@hand.cards}"  # エラーを確かめるため追加
    count.times do
      card = deck.pop
      @hand.add_card(card)
      draw_cards << card
    end
    # puts "After draw: #{@hand.cards}"  # エラーを確かめるため追加
    draw_cards
  end

  # 手札の合計値を取得
  def calculate_hand_total
    @hand.calculate_hand_total
  end
end

class Player < GamePlayer
  def initialize
    super("あなた")
  end
end

class Dealer < GamePlayer
  def initialize
    super("ディーラー")
  end
end


class Cpu1 < GamePlayer
 def initialize
   super("ブラックジャック初心者")
 end
end

class Cpu2 < GamePlayer
 def initialize
   super("ブラックジャック愛好家")
 end
end




