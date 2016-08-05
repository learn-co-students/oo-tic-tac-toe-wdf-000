
# require 'pry'
# class TicTacToe
#   # binding.pry
#   WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [1,4,7],
#     [2,5,8],
#     [0,4,8],
#     [6,4,2]
#   ]
#
#   def initialize(board = nil)
#     @board = board || Array.new(9, " ")
#   end
#
#   # def current_player
#   #   turn_count % 2 == 0 ? "X" : "O"
#   # end
#
#   def current_player
#
#   @number = turn_count
#
#   if (@number % 2 == 0)
#     return "X"
#   else
#     return "O"
#   end
#
#   end
#
#   # def turn_count
#   #   @board.count{|token| token == "X" || token == "O"}
#   # end
#   def turn_count
#     @count = 0
#   @board.each do |turn|
#     if (turn == "X" || turn == "O")
#       @count += 1
#     end
#   end
#   return @count
#   end
#
#   def display_board
#
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#   end
#
#   def move(index, current_player)
#     index = index-1
#      @board[index] = current_player
#    end
#
#
#    def position_taken?(index)
#
#      @board[index]== "X" || @board[index] == "O"
#
#    end
#
#    def valid_move?(index)
#      @index = index.to_i - 1
#      @index.between?(0,8) && !position_taken?(@index)
#   #    (index >= 0 && index <= 8) && !position_taken?(board, index)
#    end
#
#    def input_to_index(user_input)
#      @user_input.to_i - 1
#    end
#
#    def turn
#     # binding.pry
#      puts "Please enter 1-9:"
#      @user_input = gets.strip
#      @index = input_to_index(@user_input)
#      if valid_move?(@index)
#        move(@index, current_player)
#        display_board
#      else
#        turn
#      end
#    end
#
#    def won?(board)
#      WIN_COMBINATIONS.detect do |combo|
#        board[combo[0]] == board[combo[1]] &&
#        board[combo[1]] == board[combo[2]] &&
#        position_taken?(board, combo[0])
#      end
#    end
#
#    def full?(board)
#      board.all?{|token| token == "X" || token == "O"}
#    end
#
#    def draw?(board)
#      !won?(board) && full?(board)
#    end
#
#    def over?(board)
#      won?(board) || draw?(board)
#    end
#
#    def winner(board)
#      if winning_combo = won?(board)
#        board[winning_combo.first]
#      end
#    end
#
#    def play
#      while !over?(@board)
#        turn(@board)
#      end
#      if won?(@board)
#        puts "Congratulations #{winner(board)}!"
#      elsif draw?(@board)
#        puts "Cats Game!"
#      end
#    end
#
# end
# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# tic = TicTacToe.new(board)
# tic.display_board
# tic.play

class TicTacToe
  # binding.pry
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

  # def current_player
  #   turn_count % 2 == 0 ? "X" : "O"
  # end

  def current_player

  @number = turn_count

  if (@number % 2 == 0)
    return "X"
  else
    return "O"
  end

  end

  # def turn_count
  #   @board.count{|token| token == "X" || token == "O"}
  # end
  def turn_count
    @count = 0
  @board.each do |turn|
    if (turn == "X" || turn == "O")
      @count += 1
    end
  end
  return @count
  end

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(user_input, current_player="X")
    #

     @board[user_input.to_i-1] = current_player
   end


   def position_taken?(index)

     @board[index]== "X" || @board[index] == "O"

   end

   def valid_move?(index)
     #@index = index.to_i - 1
     index.to_i.between?(1,9) && !position_taken?(index.to_i-1)
      # @index = index
      # (@index >= 0 && @index <= 9) && !position_taken?(@index)
   end

   def input_to_index(user_input)
     user_input.to_i - 1
   end

   def turn
    # binding.pry
     puts "Please enter 1-9:"
     user_input = gets.strip
    #  index = user_input
     if valid_move?(user_input)
       move(user_input, current_player)

       display_board
     else
       turn
     end
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
     !won?&& full?
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
     while !over?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cats Game!"
     end
   end

end
