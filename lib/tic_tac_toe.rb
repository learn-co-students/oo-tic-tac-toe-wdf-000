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
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(i,c)
    @board[input_to_index(i)]=c
    # display_board()
  end

  def input_to_index(num)
    (1..9).include?(num.to_i) ? num.to_i-1 : false
  end

  def valid_move?(index)

    # if !input_to_index(index)
    #    false
    # end
    # index = input_to_index(index)
    #
    #  binding.pry
    # !position_taken?(index)

    if input_to_index(index)
      !position_taken?(input_to_index(index))
    else
      false
    end
  end

  def position_taken?(index)
    @board[index]=="X" || @board[index] =="O"
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    # binding.pry
    if valid_move?(index)
      move(index,current_player())
      display_board
    else
      turn()
    end
    # !valid_move?(index) ? turn() : move(index,current_player())

  end

  def current_player
    # c=0
    # @board.each { |char| c+=1 if char=="X" || char=="O" }
    turn_count%2==0? "X" : "O"

  end

  def turn_count
    c=0
    @board.each { |char| c+=1 if char=="X" || char=="O" }
    c
  end

  def won?
    result = false
    if !@board.all? { |space| space == " "  }
      WIN_COMBINATIONS.each do |win|
        if @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && @board[win[0]] != " "
          result = win
        end
      end
    end
   result
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    #binding.pry
    won? ? @board[won?[0]] : nil
  end

  def play
    # binding.pry
    if !over?
      turn
      play
    elsif
       draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
# game = TicTacToe.new
# game.turn
