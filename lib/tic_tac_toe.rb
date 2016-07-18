require 'pry'

class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
  # binding.pry
  # result = input.to_i - 1
  binding.pry
  if input.to_i.between?(1, 9)
    # binding.pry
    input.to_i - 1
  end

  # (1..9).include?(input.to_i) ? input.to_i - 1 : false
  end

  def move(index, dot = "X")
  @board[index - 1] = dot
  end

  def position_taken?(location)
  @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
  # input = index.to_i
  # input.between?(1, 9) &&
  # binding.pry
    if input_to_index(index)
    !position_taken?(input_to_index(index))
    end
  end

def turn_count
  counter = 0
  @board.each do |move|
    if move != " "
      counter += 1
end
end
return counter
end


def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  index = gets.strip
  if valid_move?(index)
    # dot = current_player
    # move(index, dot)
    index = input_to_index(index)
    move(index,current_player)
    display_board
  else
    turn
  end
end

def won?
  if WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == position_2 && position_3 == position_1 && position_1 != " "
        return win_combination
      # elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      #   return win_combination
      end
    end
  else
    return false
  end
end

def full?
  if @board.all? {|x| x == "X" || x == "O"}
    return true
  else
    return false
  end
end

def draw?
!won? && full?
end

def over?
  full? || won? || draw?
end

def winner
  if won? && !draw?
    result = won?
    # binding.pry
    y = result[0]
    return @board[y]
  else
    return nil
  end
end

def play
  counter = 0
  until over? || counter > 8
    turn
    counter += 1
  end
  if draw?
    puts "Cats Game!"
  else
    puts "Congratulations #{winner}!"
  end
end


end
