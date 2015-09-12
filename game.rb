def can_guess_it(max_num)
  new_min = min = 0
  new_max = max = rand(min..max_num)
  answer = rand(max)
  guess = question_chomp(new_min, new_max, guesses = [])
  while guess != answer
    if /[^0-9]/.match(guess)
      break if guess.downcase == "exit"
      guess == "counter" ? puts(get_counter(guesses, guess)) : puts(wrong_data(max))
      guess = question_chomp(new_min, new_max, guesses)
    else
      guess = guess.to_i
      if guess > max || guess < 0
        wrong_data(max)
        guess = question_chomp(new_min, new_max, guesses)
      elsif guess < answer
        print "too low, try again..."
        new_min = guess unless guess < new_min
        guess = question_chomp(new_min, new_max, guesses)
      elsif guess > answer
        print "too high, try again..."
        new_max = guess unless guess > new_max
        guess = question_chomp(new_min, new_max, guesses)
      elsif guess == answer
        puts "Congratulations, you guessed the number in #{guesses.size} tries."
        puts "Here are your guesses: #{guesses.inspect[1...-1]}"
      end
    end
  end
end

def question(min, max)
  "Guess a number between #{min} and #{max}: "
end

def question_chomp(min, max, container)
  print question(min, max)
  guess = gets.chomp
  counter(container, guess)
  guess
end

def counter(container, response)
  container.push(response.to_i) if /[0-9]/.match(response)
end

def get_counter(container, response)
  count = container.size
  if container.empty?
    return "You have zero guesses so far"
  else
    counter_display = container.size == 1 ? "is your #{count} guess" : "are your #{count} guesses"
  end
  "Here #{counter_display} so far: #{container.inspect[1...-1]}"
end


def wrong_data(max)
  "Invalid input, must enter a number between 0 and #{max}."
end

def play_guess_it
  puts "Level One"
  can_guess_it(100)
  puts "Level Two"
  can_guess_it(1000)
  puts "Level Three"
  can_guess_it(10000)
  puts "Level Four"
  can_guess_it(100000)
end

play_guess_it
