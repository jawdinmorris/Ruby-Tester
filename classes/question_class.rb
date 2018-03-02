#Questions class
class Question
  attr_accessor :number, :question, :answers, :correct_answer, :explain
  #Runs upon creation
  def initialize(number, question, answers, correct_answer, explain)
    @number = number
    @question = question
    @answers = answers
    @correct_answer = correct_answer
    @explain = explain
  end
  #Ask a question, accept answer and check if correct
  def ask
    puts ""
    puts "Question ##{number}" ##Put question number
    puts "#{question}"        ##ask question
    puts "#{answers}"         ##display possible answers
    user_answer = gets.chomp.to_s ##ask user for answer
    if user_answer.upcase == correct_answer ##Check to see if submitted answer is correct
      puts "Correct".green ##Congrats!
      $score = $score + 1 ##Add one
    else
      puts "Incorrect".yellow##Booo
      puts "#{explain}".green
    end
  end
end
