class Card
  SUITS = ["スペード", "ハート", "クラブ", "ダイヤ"].freeze
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@suit}の#{@rank}"
  end

# 山札を作ってシャッフル
  def self.deck
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(suit, rank)
      end
     end
    deck.shuffle!
   end

# rank部分を数値化する
   def value(current_total)
     case @rank
     when "J", "Q", "K"
         10
     when "A"
       if current_total + 11 < 21
         11
       else
          1
       end
     else
         @rank.to_i
     end
   end
end
