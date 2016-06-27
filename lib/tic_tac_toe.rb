require 'pry'

class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
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
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
    @board[location.to_i - 1] = token
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(location)
    position = location.to_i - 1
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp

    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count { |position| position != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

 def won?
   WIN_COMBINATIONS.detect do |combo|
     combo.all? { |position| @board[position] == "X" } ||
     combo.all? { |position| @board[position] == "O" }
   end
 end

 #  def won?
 #    x_win = WIN_COMBINATIONS.detect { |combo| combo.all? { |index| @board[index] == "X" } }
 #    o_win = WIN_COMBINATIONS.detect { |combo| combo.all? { |index| @board[index] == "O" } }
 #
 #    return false if x_win.nil? && o_win.nil?
 #    x_win.nil? ? o_win : x_win
 # end

  def full?
    @board.all? { |position| position != " " }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
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
