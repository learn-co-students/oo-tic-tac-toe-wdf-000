class TicTacToe

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 4, 8],
[2, 4, 6],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(input, current_player)
  position = input_to_index(input)
  @board[position] = current_player
end

def position_taken?(position)
  @board[position] != " " && @board[position] != ""
end

def valid_move?(input)
  position = input_to_index(input)
  position.between?(0,8) && !position_taken?(position)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if !(valid_move?(input))
    turn
  else  
    move(input, current_player)
    display_board
  end
end

def turn_count
   @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count.even? ? "X" : "O"
end


def detect_indexes(letter)
  @board.each_index.select{|index| @board[index] == letter}
end

def won?
  xes = detect_indexes("X")
  os = detect_indexes("O")
  WIN_COMBINATIONS.detect {
  |win_combo| (win_combo - xes).empty? || (win_combo - os).empty?}
end

def full?
  empties = @board.select{|position| position == " "}
  empties == []
end

def draw?
  !won? && full?
end

def over?
  full? || draw? || won?
end

def winner
  xes = detect_indexes("X")
  os = detect_indexes("O")
  if xes == won?
    return "X"
  elsif os == won?
    return "O"
  end
end

def play
  display_board
  while !over? 
    turn
  end
  declare_finish
end

def declare_finish
  if draw?
    puts "Cats Game!"
  elsif winner == "O"
   puts "Congratulations O!"
  else 
    puts "Congratulations X!"
  end
end


end
