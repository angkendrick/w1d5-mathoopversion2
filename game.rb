require_relative 'player'
require_relative 'engine'

class Game

  attr_accessor :turn, :round

  @p1 #instance of player 1
  @p2 #instance of player 2
  @e #instance of engine

  def initialize
    @turn = 0
    @round = 1
  end

  def get_player_names
    @e = Engine.new
    puts "Player 1 please enter your name"
    @p1 = Player.new(gets.chomp())
    puts "Hello, #{@p1.name}"
    puts "Player 2 please enter your name"
    @p2 = Player.new(gets.chomp())
    puts "Hello, #{@p2.name}"
  end

  def flip_turn
    case @turn
    when 0
      @turn = 1
    when 1 #switch to player 2
      @turn = 2
    when 2 #switch to player 1
      @turn = 1
    end
  end

  def one_round
    puts "Round: #{@round}"
    puts "#{@p1.name}: #{@p1.points}"
    puts "#{@p2.name}: #{@p2.points}"    
    puts "----"
    case @turn
    when 1
      puts "#{@p1.name} what is #{@e.populate}"
      end_round(@e.check_answer(gets.chomp()))
    when 2
      puts "#{@p2.name} what is #{@e.populate}"
      end_round(@e.check_answer(gets.chomp()))
    end
  end

  def end_round(boolean)
    case @turn
    when 1
      if boolean
        @p1.points += 1
        flip_turn
        @round += 1
      else
        flip_turn
        @round += 1
      end
    when 2
      if boolean
        @p2.points += 1
        flip_turn
        @round += 1
      else
        flip_turn
        @round += 1
      end
    end
  end

  def check_total_points
    if @p1.points == 3 
      @continue = false
      if @continue == false
        puts "#{@p1.name} wins!"
      end
    elsif @p2.points == 3
      @continue = false
      if @continue == false
        puts "#{@p2.name} wins!"
      end
    end
  end

  def run_game  
    @continue = true 
    get_player_names
    flip_turn
    while @continue
      one_round
      check_total_points
    end
  end

end