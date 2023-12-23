require_relative 'card'
require_relative 'hand'
require_relative 'gameplayer'
require_relative 'Judge'
require_relative 'gameflow'


# それぞれのクラスのインスタンスを生成
deck = Card.deck
hand = Hand.new
player = Player.new
dealer = Dealer.new
cpu1 = Cpu1.new
cpu2 = Cpu2.new
judge = Judge.new(player, dealer, cpu1, cpu2)
game_flow = GameFlow.new(player, dealer, cpu1, cpu2, deck)

# ゲームを開始
game_flow.start_game
