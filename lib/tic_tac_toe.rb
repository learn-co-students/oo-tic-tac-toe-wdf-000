require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts   "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts   "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(index, value = "X")
  index.to_i - 1
  @board[index.to_i - 1] = value
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end

def valid_move?(index)
  index = index.to_i - 1
  if !(position_taken?(index)) && index >= 0 && index <= 8
    true
  else
    false
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    if valid_move?(user_input)
      value = current_player
      move(user_input, value)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |element|
     if element != " " && element != ""
        counter += 1

    end
    end
    counter
  end

  def current_player
    if turn_count % 2 != 0
      "O"
    else
      "X"
    end
  end


  def won?

    WIN_COMBINATIONS.each do |win_combination|

        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combination
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination
          end

    end
    return false
  end

  def full?
  @board.all? do |space|
    space != " "
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
  winning_line = won?
  if winning_line
    position = winning_line.first
    return @board[position]
  else
    nil
  end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end



end
