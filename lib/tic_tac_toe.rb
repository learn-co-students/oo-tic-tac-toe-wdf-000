require "pry"
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

 def initialize()
   @board = Array.new(9, " ")
 end

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def move(location, token = "X")
   @board[location.to_i - 1] = token
 end

 # this method is being passed an integer as a parameter
 def position_taken?(position)
  #  index = position.to_i - 1
   @board[position] != " "
 end

 # this method is being passed a string so #position_taken? needs it
 # to be converted to an integer
 def valid_move?(position)
   index = position.to_i - 1
   index.between?(0,8) && !position_taken?(index)
 end

 # unlike the procedural way, we don't have to pass any parameters to #turn
 def turn
   puts "Please enter 1-9"
   input = gets.chomp

   if valid_move?(input)
     move(input, current_player)
     display_board
   else
     turn
   end
 end

 def turn_count
   @board.count { |e| e != " " }
 end

 # take another look at this method. Why isn't "O" coming before "X"
 # this method is checking for the next turn, not the current turn taking place
 def current_player
   turn_count.even? ? "X" : "O"
 end

 def won?
   if @board.all? { |position| position == " " }
     false
   else
     x_win = WIN_COMBINATIONS.detect { |combo| combo.all? { |index| @board[index] == "X" } }
     o_win = WIN_COMBINATIONS.detect { |combo| combo.all? { |index| @board[index] == "O" } }

     if (x_win == nil)
       return o_win
     else
       return x_win
     end
   end
 end

 def full?
   @board.all? { |e| e != " " }
 end

 def draw?
   # not won AND full
   # if first check returns false there cannot be a draw yet
   !won? && full?
 end

 def over?
   # checking for full? failed because it was asking to check for a draw
   # by checking for draw? we are also checking if the board is full
   # because you can't have a draw unless the board is full
   won? || draw?
 end

 def winner
   # @board[won?[0]] explained:
   # after a win, #won? will contain winning array from WIN_COMBINATIONS
   # any of the indices in that array will contain winning location
   # which we look up in @board and get the actual winning character
  #  won? ? @board[won?[0]] : nil
  if won? then @board[won?[0]] end
 end

 def play
   # until over? evaluates to true, keep taking turns
   until over?
     turn
   end

   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cats Game!"
   end
 end
 # binding.pry
end
