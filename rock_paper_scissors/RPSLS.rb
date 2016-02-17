VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

player_wins = 0
computer_wins = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def letter_abbreviation(str)
  case str
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  else
    str
  end
end
  
def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'rock' && second == 'lizard') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'lizard' && second == 'paper') ||
  (first == 'spock' && second == 'scissors') ||
  (first == 'spock' && second == 'rock')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def game_end(choice_wins, computer_choice_wins)
  if choice_wins == 5
    prompt("You have won 5 times!")
  elsif computer_choice_wins == 5
    prompt("The computer has won 5 times!")
  else
    prompt("You have won #{choice_wins} times and the computer has won #{computer_choice_wins} times.")
  end
end
  
loop do # main loop
  choice = ''
  loop do
    prompt("Choose one: (r)ock, (p)aper, (s)cissors, (l)izard, (sp)ock")
    choice = Kernel.gets().chomp()
    choice = letter_abbreviation(choice)
    
    if VALID_CHOICES.include?(letter_abbreviation(choice))
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  
  computer_choice = %w(rock paper scissors lizard spock).sample
  
  prompt("You chose: #{choice}; Computer chose #{computer_choice}")
  
  if win?(choice, computer_choice)
    player_wins += 1
  elsif win?(computer_choice, choice)
    computer_wins += 1
  end
  
  display_result(choice, computer_choice)
  
  game_end(player_wins, computer_wins)
  break if (player_wins == 5) || (computer_wins == 5)
end # end main loop

prompt("Thank you for playing. Good bye!")