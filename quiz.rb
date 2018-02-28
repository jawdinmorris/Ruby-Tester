$score = 0

# def questions (question, answer)
#   puts question
#   user_answer = gets.chomp
#   if user_answer.upcase == answer.upcase
#     puts "Correct"
#   else
#     puts "Incorrect"
#   end
# end
#
# questions("In what year was Ruby released? \n A - 1992 \n B - 1995 \n C - 2002 \n D - 2005", "B")
# questions
#
# Store each questions and answers as a class in an array
# loop through the array

class Question
  attr_accessor :question, :answers, :correctanswer
  def initialize(question, answers, correctanswer)
    @question = question
    @answers = answers
    @correctanswer = correctanswer
  end
  def ask
    puts "#{question}"
    puts "#{answers}"
    user_answer = gets.chomp.to_s
    if user_answer == correctanswer
      puts "Correct"
      $score = $score + 1
    else
      puts "Incorrect"
  end
end
end

question1 = Question.new("In what year was Ruby first released?",
"(A) 1992 \n(B) 1995 \n(C) 2002 \n(D) 2005",
"B")

question2 = Question.new("What is Ruby?",
"(A) A programming language \n(B) A precious Stone \n(C) Framework \n(D) Data Structure",
"A")

testarray =[]
testarray << question1
testarray << question2

testarray.each do |question|
  question.ask
end
puts $score
