require 'byebug'
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
    game_over_message
    reset_game
  end

  def take_turn
    unless game_over
      show_sequence
      unless require_sequence
        @game_over = true
      end
      round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    print "Input sequince (i.e. red,blue,green,yellow): "
    user_input = gets.chomp.split(",")
    return true if user_input == @seq
    false
  end

  def add_random_color
    random_color = COLORS[rand(4)]
    @seq << random_color
  end

  def round_success_message
    puts "Correct! round #{sequence_length}: "
  end

  def game_over_message
    puts "I'm sorry that was incorrect"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
