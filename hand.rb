class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  # 手札にカードを追加
  def add_card(card)
    @cards << card
  end

# 手札の合計点数を取得
  def calculate_hand_total
    total = 0
    ace_count = 0

    @cards.each do |card|
      total += card.value(total)
      if card.rank == "A"
        ace_count += 1
      end
    end

    # Aが手札にあり、Aを11として加算した場合でも21を超えない場合、11を加算
    while ace_count > 0 && total + 11 < 21
      total += 11
      ace_count -= 1
    end

    total
   end
end