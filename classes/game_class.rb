#Class for the main game
class Game
  #Upon the beginning print the title table
  def begin(table)
    puts table
    puts "What is your name?"
    $name = gets.chomp.to_s
    puts "Press Enter to start."
    gets
    $time_one = Time.now
  end
  #Go through each question doing .ask
  def main(questionarray)
    questionarray.each do |question|
      question.ask ##ask the question
    end
  end

  #Display score, time, comment and applause.
  def ending
    time_two = Time.now ##grab finishing time
    $elapsed = time_two - $time_one ##figure time elapsed
    ##after all questions asked display score
    puts ""
    puts "Congratulations you scored #{$score} points out of 15."
    puts "Time taken: #{Time.at($elapsed).utc.strftime("%M:%S")}"
    if $score < 5
      puts "You haven't done well, keep trying!"
      $display_score = '%2d' % $score
     elsif $score < 10
       puts "Good work, keep improving!".yellow
       $display_score = '%2d' % $score
     else
       puts "Brilliant work! You're a pro at Ruby.".green
       $display_score = $score
    end
    #Check operating system
    if OS.windows?
      Sound.play("resources/applause.wav")
    elsif OS.mac?
      pid = fork{ exec 'afplay', "applause.wav"}
    end
  end

  #Create a leaderboard
  def leaderboard
    #Add score to leaderboard regardless
    File.open("leaderboard.txt", "a") do |line|
      line.puts "Score: #{$display_score}" << " Time: #{Time.at($elapsed).utc.strftime("%M:%S")}" << " Name: #{$name}".green
    end
    puts "Would you like to see the leaderboard? Y/N"
    #Sort the file alphabetically in reverse
    if gets.chomp.upcase == "Y"
      puts ""
      sorted_file = [File.readlines('leaderboard.txt').sort.reverse]
      puts sorted_file
      puts ""
    end
    ##Do you wish to leave?
    puts "Press enter to exit."
    gets
  end
end
