# Run #run_game from Game instane

class Engine

  attr_accessor :random1, :random2, :answer, :operation

  def initialize
    @random1 = 0
    @random2 = 0
    @answer = 0
    @operation = ""
  end

  def generate_random_numbers
    @random1 = rand(1..20)
    @random2 = rand(1..20)
  end

  def generate_operation
    case rand(1..4)
    when 1
      @operation = "+"
    when 2
      @operation = "-"
    when 3
      @operation = "*"
    when 4
      @operation = "/"
    end
  end

  def generate_answer
    @answer = @random1.send(@operation, @random2)
    @answer
  end

  def populate
    generate_random_numbers
    generate_operation
    generate_answer
    "#{@random1} #{@operation} #{@random2} = ?"
  end

  def check_answer(ans)
    puts "#{@answer} #{ans}"
    if @answer.to_i == ans.to_i
      puts "Correct!"
      true
    else
      puts "Wrong!"
      false
    end
  end


end