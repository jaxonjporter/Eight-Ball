require "pry"
require "colorize"


class Eightball
  attr_accessor :choice, :answerarray

  def initialize
    @choice = ""
    @choicearray = [
      "It is certain",
      "It is decidedly so",
      "Without a doubt",
      "Yes definitely",
      "You may rely on it",
      "As I see it, yes",
      "Most likely",
      "Outlook good",
      "Yes",
      "Signs point to yes",
      "Reply hazy try again",
      "Ask again later",
      "Better not tell you now",
      "Cannot predict now",
      "Concentrate and ask again",
      "Don't count on it",
      "My reply is no",
      "My sources say no",
      "Outlook not so good",
      "Very doubtful"
    ]
    @answerarray = @choicearray.clone
    question
  end

  def question
    puts "Welcome to the Magic 8 Ball.".cyan
    puts
    puts "Type a question to get an answer, or type quit to end the program".cyan
    print "> ".cyan
    @choice = gets.downcase.strip
    while @choice != "quit"
      case @choice 
        when "add_answer"
          add_answer
        when "reset_answers"
          reset
        when ""
          puts "\nInvalid Entry. Try again".red
          print "> ".cyan
          @choice = gets.downcase.strip
        when "view_answers"
          @answerarray.each do |colored|
            puts "#{colored}".green
          end
          puts
          question
        else
          answer
          sleep(1)
          question
      end
    end
    exit
  end

  def answer
    puts "\n#{@answerarray.sample}\n ".yellow
  end

  def add_answer
    puts " \nWhat answer you you like to add?".cyan
    print "> ".cyan
    @input = gets.downcase.strip
    @downcasearray = @answerarray.map(&:downcase)
    if @input != "quit"
      if @downcasearray.include? @input
        puts "\nThat answer already exists".red
        sleep(1)
        add_answer
      elsif @input.empty?
        puts "\nInvalid Entry. Try again.".red
        add_answer
      else
        @answerarray << @input.capitalize
        testput = @input.capitalize
        puts "\nNew answer added".red
        sleep(2)
        question
      
      end
    else
      exit
    end
  end

  def reset
    @answerarray = @choicearray.clone
    puts "\nYour answer list has been reset.".red
    puts
    sleep(2)
    question
  end


end

Eightball.new()