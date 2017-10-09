class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    reset_game
  end

  def take_turn
    unless game_over
      show_sequence
      if @seq == require_sequence
        round_success_message
      else
        game_over_message
        @game_over = true
      end
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    print "Input sequince (i.e. red,blue,green,yellow): "
    user_input = gets.chomp.split(",");
    user_input
  end

  def add_random_color
    random_color = COLORS[rand(4)]
    @seq << random_color
  end

  def round_success_message
    puts "Correct! round #{sequence_length}: "
  end

  def game_over_message
    puts "I'm sorry that was incorrect. The correct sequence was #{@seq}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
