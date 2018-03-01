#Import dependencies
require 'colorize'
require 'os'
require 'win32/sound'
require 'terminal-table'
require_relative 'classes.rb'
include Win32

#Create questions
question1 = Question.new(1, "In what year was Ruby first released?",
"(A) 1992 \n(B) 1995 \n(C) 2002 \n(D) 2005",
"B", "Correct answer is B. Ruby was first released in 1995.")
question2 = Question.new(2, "What is Ruby?",
"(A) A programming language \n(B) A precious Stone \n(C) Framework \n(D) Data structure",
"A", "Correct answer is A. Ruby is a programming language.")
question3 = Question.new(3, "What is a Gem?",
"(A) Library \n(B) A version of Ruby \n(C) A precious stone \n(D) Method",
"A", "Correct answer is A. A gem is a form of library.")
question4 = Question.new(4, "What is the correct file extension for a ruby source code?",
"(A) .gif \n(B) .irb \n(C) .png \n(D) .rb",
"D", "Correct answer is D. '.rb' is the file extension for Ruby?")
question5 = Question.new(5, "Which of the following is an integer?",
"(A) '42' \n(B) 42 \n(C) 'Forty-Two' \n(D) 42.5",
"B", "Correct answer is B. 40 is an integer.")
question6 = Question.new(6, "Where can Official Ruby Documentation be found?",
"(A) www.youtube.com \n(B) www.github.com \n(C) www.ruby-doc.org \n(D) www.stackoverflow.com",
"C", "Correct answer is C. All documentation can be found on www.ruby-doc.org.")
question7 = Question.new(7, "How do you convert to a string?",
"(A) 35.to_f \n(B) 35.to_string \n(C) 35 = string \n(D) 35.to_s",
"D", "Correct answer is D. .to_s converts to string.")
question8 = Question.new(8, "How do you display to terminal, with a new line?",
"(A) prints \n(B) display \n(C) puts \n(D) push",
"C", "Correct answer is C. puts creates a new line and displays text.")
question9 = Question.new(9, "How do you receive input from the user?",
"(A) receive \n(B) chomp \n(C) gets \n(D) ask",
"C", "Correct answer is C. gets asks the user for input.")
question10 = Question.new(10, "Which of the following is NOT a reserved keyword?",
"(A) when  \n(B) lift  \n(C) if \n(D) class",
"B", "Correct answer is B. lift is the only non-reserved word on the list.")
question11 = Question.new(11, "Which of the following tests if 'a' is larger than 'b'?",
"(A) a > b  \n(B) a < b \n(C) a==b \n(D) ab",
"A", "Correct answer is A. Greater than is symbolised using >")
question12 = Question.new(12, "Get the first letter from the string 'Hello World'",
"(A) 'Hello World'.first  \n(B) 'Hello World'[0]  \n(C) [0]'Hello World'  \n(D) 'Hello World'.give.first",
"B", "Correct answer is B. [0] returns the first element of a data structure.")
question13 = Question.new(13, "Which of the following is a float?",
"(A) '12.5' \n(B) 12 \n(C) 'twelve point five'  \n(D) 12.50",
"D", "Correct answer is D. A float is a number with a decimal place.")
question14 = Question.new(14, "What would be the result of 10 % 3?",
"(A) 3 \n(B) 1 \n(C) 10 \n(D) 30",
"B", "Correct answer is B. The remainder (modulo) of 10/3 is 1.")
question15 = Question.new(15, "Which of the following provides 5 squared?",
"(A) 5 * 2 \n(B) 5 ** 5  \n(C) five.square  \n(D) 5 ** 2",
"D", "Correct answer is D. ** symbolised to the power of. ** 2 means squared.")

#Create a title - (put in a class maybe?)
rows = []
rows << ["This quiz will test your knowledge on Ruby. It is 15 multiple choice questions.".center(100).blue ]
rows << ["Please enter a letter to answer each question. You will be timed.".center(100).blue]
rows << ["Good luck!".center(100).blue ]
table = Terminal::Table.new :title => 'WELCOME TO RUBY TESTER'.blue, :rows => rows

##Collate Questions
questionarray =[]
questionarray << question1 << question2 << question3 << question4 << question5 << question6 << question7 << question8 << question9 << question10 << question11 << question12 << question13 << question14 << question15

##Declaring global variables (dooodgy section)
$score = 0
$time_one = 0
$name = "No Name Entered"

#Run game
run = Game.new
run.begin(table)
run.main(questionarray)
run.ending
run.leaderboard
