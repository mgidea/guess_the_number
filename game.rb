@answer = rand(1000)

  def can_guess_it
  question = "Guess a number between 0 and 1000: "
  print question
  guess = gets.chomp
  int = guess.to_i

    if /[^0-9]/.match(guess)  || int >= 1001 || int < 0
    print " Invalid input, must enter a number between 0 and 1000."
    can_guess_it
    else
      if int < @answer
      print " too low, try again..."
      can_guess_it
      else
        if int > @answer
        print" too high, try again..."
        can_guess_it
        else
          if int = @answer
          print "Congratulations, you guessed the number."
          end
        end
      end
    end
  end
can_guess_it
