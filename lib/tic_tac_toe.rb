#comment
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

class TicTacToe
	#def initialize ( boards=Array.new(9," "))
	def initialize ( boards = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
		@board = boards
	end	


	def board= ( boards = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
		@board = boards
	end

	def display_board
	  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	  puts "-----------"
	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	  puts "-----------"
	  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def move( index, player)
		#to be removed
	index = input_to_index(index)
	#index = input_to_index(index)
	  @board[index] = player
	end

=begin
	def valid_move?(index)
	  if (index >= 0 && index <=8)
	    if (position_taken?(index))
	      return false
	    else
	      return true
	    end
	  else
	    return false
	  end
	end
=end

	def valid_move?(index)
	   index = index.to_i - 1
	   #index > -1 && index < 9 && !position_taken?(index)
	   index.between?(0,8) && !position_taken?(index)
	end

	def position_taken?(index)
	  @board[index]== "X" || @board[index] == "O"
	  # Creates a stop on RSpec
	  # !(board[location].nil? || board[location] == "")
	end

	def input_to_index(user_input)
	  user_input.to_i - 1
	end
	
=begin
	def turn
	  puts "Please enter 1-9:"
	  user_input = gets.strip
	  index = input_to_index(user_input)
	  if valid_move?(index)
	    move(index, current_player)
	    display_board
	  else
	    turn
	  end
	end
=end

	def turn 
	  puts "Please enter 1-9:"
	  index = gets.strip.to_i
	  if valid_move?(index)
	    move(index, current_player)
	    display_board
	  else
	    turn
	  end

	end

	
	def current_player
	  turn_count % 2 == 0 ? "X" : "O"
	end

	def turn_count
	  @board.count{|token| token == "X" || token == "O"}
	end
	def won?
	  WIN_COMBINATIONS.detect do |combo|
	    @board[combo[0]] == @board[combo[1]] &&
	    @board[combo[1]] == @board[combo[2]] &&
	    position_taken?(combo[0])
	  end
	end
	def full?
	  @board.all?{|token| token == "X" || token == "O"}
	end
	def draw?
	  !won? && full?
	end

	def over?
	  won? || draw?
	end
	def winner
	  if winning_combo = won?
	    @board[winning_combo.first]
	  end
	end

	def play
		until (over?)
			if (draw?)
				break
			end
			turn
		end

		if (won?)
			puts "Congratulations " + winner + "!"
		elsif
			puts "Cats Game!"
		end
	end
end
