VALID_CHOICES = %w(r p s l S)

CHOICE_TRANSLATOR = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'S' => 'Spock' }

player_wins = 0
computer_wins = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'r' && ((second == 's') || (second == 'l'))) ||
    (first == 'p' && ((second == 'r') || (second == 'S'))) ||
    (first == 's' && ((second == 'p') || (second == 'l'))) ||
    (first == 'l' && ((second == 'S') || (second == 'p'))) ||
    (first == 'S' && ((second == 's') || (second == 'r')))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost.")
  else
    prompt("You tied.")
  end
end

def game_over(p_wins, c_wins)
  if p_wins == 5
    prompt("You have won 5 times!  Congratulations!")
  elsif c_wins == 5
    prompt("The computer has won 5 matches, and is the victor.")
  else
    prompt("You have won #{p_wins} times, and the computer has won #{c_wins} times.")
  end
end

loop do
  choice = ''

  loop do
    prompt("Choose one: 'r' for rock, 'p' for paper, 's' for scissors, 'l' for lizard, or 'S' for Spock.")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = %w(r p s l S).sample

  prompt("You chose #{choice} for #{CHOICE_TRANSLATOR[choice]}, and the computer chose #{computer_choice} for #{CHOICE_TRANSLATOR[computer_choice]}.")

  if win?(choice, computer_choice)
    player_wins += 1
  elsif win?(computer_choice, choice)
    computer_wins += 1
  end

  display_results(choice, computer_choice)

  game_over(player_wins, computer_wins)
  break if (player_wins == 5) || (computer_wins == 5)
end

prompt("Thank you for playing.  Goodbye!")