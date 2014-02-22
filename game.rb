def can_guess_it
  max = rand(1000..2000)
  answer = rand(max)
  question = "Guess a number between 0 and #{max}: "
  guess = question_chomp(question)
  while guess != answer
    if /[^0-9]/.match(guess)
      wrong_data(max)
      guess = question_chomp(question)
    else
      guess = guess.to_i
      if guess >= (max + 1) || guess < 0
        wrong_data(max)
        guess = question_chomp(question)
      elsif guess < answer
        print "too low, try again..."
        guess = question_chomp(question)
      elsif guess > answer
        print "too high, try again..."
        guess = question_chomp(question)
      elsif guess == answer
        print "Congratulations, you guessed the number."
        break
      end
    end
  end
end

def question_chomp(question)
  print question
  gets.chomp
end

def wrong_data(max)
  puts "Invalid input, must enter a number between 0 and #{max}."
end
can_guess_it
