class SlotMachine
  attr_accessor :reels
  def initialize(reels = [])
    # make sure to convert each element of @reels to symbol
    @reels = reels.map { |element| element.to_sym }
  end
  
  # create scoreboard
  SCOREBOARD = {
    joker: [50, 25],
    star: [40, 20],
    bell: [30, 15],
    seven: [20, 10],
    cherry: [10, 5]
  }
  # SCOREBOARD[:joker] => 50
  
  def score
    # check if three equals
    if @reels.uniq.count == 1
      # uniq([joker joker bell]) => [joker bell]
      # uniq([joker joker joker]) => [joker]
      symbol = @reels[0].to_sym
      SCOREBOARD[symbol][0] # [50, 25]
    # check if contains two equals and at least one joker
    elsif @reels.uniq.count == 2 && @reels.include?(:joker)
      # [joker bell joker]
      # [joker joker bell]
      # [bell joker joker]
      # count joker 
      if @reels.count(:joker) == 1
        # delete(:joker)
        @reels.delete(:joker) 
        symbol = @reels[0].to_sym
        SCOREBOARD[symbol][1] # [50, 25]
      else
        # if == 2 => 25
        SCOREBOARD[:joker][1]
      end
    else 
      0
    end
  end

  def play
    # empty @reels
    @reels = []
    # repopulate @reels
    3.times do
      @reels << SCOREBOARD.keys.sample
    end
    # show game result
    puts "> #{@reels} <"
    # show game score
    puts "You scored #{score} points!"
  end
end
