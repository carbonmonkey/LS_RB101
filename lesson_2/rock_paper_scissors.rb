require 'yaml'
COLLECTIONS = YAML.load_file('rock_paper_scissors_collections.yml')

def prompt(message)
  puts "=> #{message}"
end

def grab(key, subkey = '')
  subkey.empty? ? COLLECTIONS[key] : COLLECTIONS[key][subkey]
end

def display_choices
  prompt("Choose one:")

  grab(:options).each do |option, sub_hash|
    until option.length >= 8
      option += ' '
    end

    prompt("#{option} (or #{sub_hash[:valid_letter]})")

    sleep(0.2)
  end
end

def get_choice
  loop do
    choice = gets.chomp.downcase.strip

    grab(:options).each do |option, sub_hash|
      return option if option == choice || sub_hash[:valid_letter] == choice
    end

    prompt("That's not a valid choice.")
    prompt("Please try again. You can optionally enter the first letter "\
          "of your choice (or v for spock)")
  end
end

def player_win?(player, computer)
  grab(:options, player).values.include?(computer)
end

def computer_win?(player, computer)
  (player != computer) && !player_win?(player, computer)
end

def display_match_results(winner, loser)
  prompt("#{winner} #{grab(:options, winner).key(loser)} #{loser}!")
end

def display_results(player, computer)
  if player == computer
    prompt("It's a tie!\n\n")

  elsif player_win?(player, computer)
    display_match_results(player, computer)
    prompt("You won!\n\n")

  else
    display_match_results(computer, player)
    prompt("Computer won!\n\n")

  end
end

def score_string(score)
  "you -> #{score[:player]}, computer -> #{score[:computer]}\n\n"
end

def display_score(score)
  prompt("The score is:  #{score_string(score)}")
end

def display_winner(score)
  prompt("The final score is: #{score_string(score)}")

  if score[:player] > score[:computer]
    prompt("You are the grand winner!\n\n")

  else
    prompt("Sorry, computer is the grand winner. Better luck next time.\n\n")

  end
end

def display_title
  puts "#{grab(:options).keys.map(&:capitalize).join(', ')} v1.1\n\n"
end

def play_again?
  prompt("Do you want to play again? (y or n)")

  loop do
    answer = gets.chomp.downcase.strip

    if answer == 'y'
      return true

    elsif answer == 'n'
      return false

    else
      prompt("Please enter 'y' or 'n'")

    end
  end
end

system('clear')

display_title

prompt "Press 'ENTER' to play..."
gets

system('clear')

loop do # main loop
  score = {
    player: 0,
    computer: 0
  }

  round = 1

  prompt("First to three wins is the grand winner\n\n")

  loop do # round loop
    sleep(1)

    prompt("Round #{round}\n\n")

    sleep(1)

    display_score(score)

    sleep(0.5)

    display_choices
    choice = get_choice

    computer_choice = grab(:options).keys.sample

    system('clear')

    sleep(0.5)

    prompt("You chose: #{choice}")
    sleep(0.5)
    prompt("Computer chose: #{computer_choice}\n\n")

    sleep(1)

    display_results(choice, computer_choice)

    score[:player] += 1 if player_win?(choice, computer_choice)
    score[:computer] += 1 if computer_win?(choice, computer_choice)

    break if score[:player] == 3 || score[:computer] == 3

    round += 1
  end

  sleep(1)

  display_winner(score)

  sleep(1)

  break unless play_again?
  system('clear')
end

prompt("Thank you for playing. Good bye!\n\n")
