class Question ##Create a blueprint(class) for each question
  attr_accessor :number, :question, :answers, :correct_answer, :explain ##Each question CAN hold those attributes
  def initialize(number, question, answers, correct_answer, explain) ##Run this upon creation of object, accepting these arguments
    @number = number
    @question = question
    @answers = answers
    @correct_answer = correct_answer
    @explain = explain
  end
  def ask ## this is a method run using questionX.ask - Main logic of our program
    puts ""
    puts "Question ##{number}" ##Put question number
    puts "#{question}"        ##ask question
    puts "#{answers}"         ##display possible answers
    user_answer = gets.chomp.to_s ##ask user for answer
    if user_answer.upcase == correct_answer ##Check to see if submitted answer is correct
      puts "Correct".green ##Congrats!
      $score = $score + 1 ##Add one
    else
      puts "Incorrect".red ##Booo
      puts "#{explain}".green
  end
end
end

class Game
  def begin(table)
    puts table
    puts "Press any button to start.."
    gets
    $time_one = Time.now
  end
  def main(questionarray)
    questionarray.each do |question|
      question.ask ##ask the question
    end
  end
  def end
    time_two = Time.now ##grab finishing time
    elapsed = time_two - $time_one ##figure time elapsed
    ##after all questions asked display score
    puts ""
    puts "Congratulations you scored #{$score} points out of 15."
    puts "Time taken: #{Time.at(elapsed).utc.strftime("%M:%S")}"
    if $score < 5
      puts "You haven't done well, keep trying!".red
     elsif $score < 10
       puts "Good work, keep improving!".yellow
     else
       puts "Brilliant work! You're a pro at Ruby.".green
    end
    if OS.windows?
      Sound.play("resources/applause.wav")
    elsif OS.mac?
    pid = fork{ exec 'afplay', "applause.wav"}
    end
  end
end
