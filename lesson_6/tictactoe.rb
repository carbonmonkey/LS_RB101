WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

EMPTY_SQUARE = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_typed_words(msg)
  "=> #{msg}".each_char do |char|
    sleep(0.1)
    print char
  end
end

def display_intro_screen
  system('clear')
  sleep(1)

  display_typed_words("Tic Tac Toe v1.0\n\n")
  sleep(1)

  display_typed_words("First to 5 wins is the Grand Winner\n\n")
  sleep(1)

  display_typed_words("Get ready to play...........")
  system('clear')
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, score)
  system('clear')
  display_score(score)
  prompt "You're a #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}.\n\n"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = EMPTY_SQUARE }
  new_board
end

def choose_first_player
  prompt "Choose an option:"
  puts "1.) Player goes first"
  puts "2.) Computer goes first"
  puts "3.) Let Computer decide"

  loop do
    choice = gets.to_i

    return choice if (1..3).cover?(choice)

    prompt "Invalid option. Please choose 1, 2, or 3"
  end
end

def set_first_player
  choice = choose_first_player

  case choice
  when 1 then 'Player'
  when 2 then 'Computer'
  else ['Player', 'Computer'].sample
  end
end

def alternate_player(player)
  player == 'Player' ? 'Computer' : 'Player'
end

def joinor(squares, delimiter = ', ', final_delimiter = 'or')
  if squares.size == 1
    squares.first
  elsif squares.size == 2
    "#{squares.first} #{final_delimiter} #{squares.last}"
  else
    squares[0..-2].join(delimiter) +
      "#{delimiter}#{final_delimiter} #{squares.last}"
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if able_to_win?(brd)
             best_move(brd, COMPUTER_MARKER)
           elsif immediate_threat?(brd)
             best_move(brd, PLAYER_MARKER)
           elsif empty_squares(brd).include?(5)
             5
           else
             empty_squares(brd).sample
           end

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  player == 'Player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def best_move(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      line.each { |sqr| return sqr if brd[sqr] == EMPTY_SQUARE }
    end
  end
  nil
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def immediate_threat?(brd)
  !!best_move(brd, PLAYER_MARKER)
end

def able_to_win?(brd)
  !!best_move(brd, COMPUTER_MARKER)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == EMPTY_SQUARE }
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def keep_score!(score, brd)
  score[:player] += 1 if detect_winner(brd) == 'Player'
  score[:computer] += 1 if detect_winner(brd) == 'Computer'
end

def display_score(score)
  prompt "Score: Player #{score[:player]}, Computer #{score[:computer]}\n\n"
end

def grand_winner?(score)
  score.values.any? { |num| num >= 5 }
end

def display_grand_winner(score)
  display_score(score)
  if score[:player] > score[:computer]
    prompt "Player is the Grand Winner!\n\n"
  else
    prompt "Sorry, Computer is the Grand Winner this time.\n\n"
  end
end

def play_again?
  answer = ''
  prompt "Play again? (y or n)"

  loop do
    answer = gets.chomp.downcase.strip
    break if %w(y n).include? answer
    prompt "Not a valid choice. Please enter y or n."
  end

  answer == 'y'
end

score = { player: 0, computer: 0 }
match_num = 1

display_intro_screen

loop do # main loop
  board = initialize_board

  prompt "Match #{match_num}\n\n"

  current_player = set_first_player
  prompt "#{current_player} goes first!"

  sleep(1.5)

  loop do # match loop
    display_board(board, score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, score)

  match_num += 1

  if someone_won?(board)
    keep_score!(score, board)
    display_board(board, score)

    prompt "#{detect_winner(board)} won!\n\n"
  else
    prompt "It's a tie!\n\n"
  end

  sleep(3)
  system('clear')

  if grand_winner?(score)
    display_grand_winner(score)

    break unless play_again?
    system('clear')

    score = { player: 0, computer: 0 }
    match_num = 1
  end
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
