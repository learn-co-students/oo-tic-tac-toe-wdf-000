class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end



WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

# def input_to_index(user_input)
#   user_input.to_i - 1
# end

def move(input, token)
  @board[input.to_i-1] = token
end

def position_taken?(position)
  !(@board[position].nil? || @board[position] == " ")
end

def valid_move?(position)
  position = position.to_i
  position.between?(1,9) && !position_taken?(position-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input,current_player)
    display_board
  else
    turn
  end
end

def turn_count
counter = 0
@board.each do |space|
  if space == 'X' || space == "O"
    counter += 1
  end 
end
return counter
end


def current_player
  turn_count.even? ? "X" : "O"
end



def won?

  WIN_COMBINATIONS.each do |arr|

    one = arr[0]
    two = arr[1]
    three = arr[2]

    if @board[one] == @board[two] && @board[two] == @board[three] && @board[one] != " "
        return arr
    end
  end
  return false
end


def full?

  not_full = @board.any? do |space|
    space == " " || space == "  "
  end
  !not_full
end


def draw?
 !won? && full? ? true : false
end

def over?
  if won? != false || draw? || full?
    return true
  else 
    return false
  end
end

def winner
  if won? != false
    arr = won?
  return @board[arr[0]]
end
end


def play

  while !over?
    turn
  end

if draw?
  puts "Cats Game!"
else
  puts "Congratulations #{winner}!"
end

end


end


