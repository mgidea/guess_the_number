def can_guess_it
  max = rand(1000..2000)
  answer = rand(max)
  question = "Guess a number between 0 and #{max}: "
  guesses = []
  guess = question_chomp(question)
  counter(guesses, guess)
  while guess != answer
    if /[^0-9]/.match(guess)
      wrong_data(max)
      guess = question_chomp(question)
      counter(guesses, guess)
    else
      guess = guess.to_i
      if guess > max || guess < 0
        wrong_data(max)
        guess = question_chomp(question)
        counter(guesses, guess)
      elsif guess < answer
        print "too low, try again..."
        guess = question_chomp(question)
        counter(guesses, guess)
      elsif guess > answer
        print "too high, try again..."
        guess = question_chomp(question)
        counter(guesses, guess)
      elsif guess == answer
        puts "Congratulations, you guessed the number in #{guesses.size} guesses."
        puts "Here are your guesses: #{guesses.inspect[1...-1]}"
        break
      end
    end
  end
end

def question_chomp(question)
  print question
  gets.chomp
end

def counter(container, response)
  container.push(response.to_i)
end

def wrong_data(max)
  puts "Invalid input, must enter a number between 0 and #{max}."
end
can_guess_it
