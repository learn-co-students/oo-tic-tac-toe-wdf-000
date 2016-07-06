require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ") 
  end

  def display_board
    puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts"-----------"
    puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts"-----------"
    puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

  def move(index, player_token)
      # player_token == "X" || "O"
      # binding.pry
      @board[input_to_index(index)] = player_token
  end

def input_to_index(index)
   index.to_i - 1
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  index = index.to_i - 1
   # binding.pry
  index.between?(0,8) && !position_taken?(index)
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  puts "Please enter 1-9:" 
  index = gets.strip
  if valid_move?(index)
    # binding.pry
      move(index, current_player)
      display_board
  else
    turn
  end
end

  def turn_count
    counter = 0

    @board.each do |space|
      if space != " "
        counter += 1
      end
    end
      counter
  end

  def won?
      # if !board.empty?
      #   return false
      # end
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
      @board.each do |index|
        if index == " " 
          return false
      end
    end
  end 

  def draw?
    if !won? && full?
    return true
    end
  end

  def over?
    if won? || draw?
      return true
    end
  end

  def winner
    if won? then @board[won?[0]] 
    end
  end

 def play
    if !(full? || over?)
      turn 
      play
    elsif 
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
  end
 end 



end