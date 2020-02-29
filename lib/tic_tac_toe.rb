#require 'pry'
class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token="X")
    @board[position.to_i - 1] = token
  end

  def position_taken?(position)
    @board[position.to_i] == "X" || @board[position.to_i] == "O"
  #  binding.pry
  end

  def valid_move?(position)
    @board[position.to_i-1] != "X" && @board[position.to_i-1] != "O" && (1..9).include?(position.to_i)
  end

  def turn
    token = current_player
    loop do
      puts "Please choose a free slot (1-9):"
      position = gets.chomp
      if valid_move?(position)
        move(position, token)
        display_board
        break
      else
        puts "Invalid move."
      end
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    combos = WIN_COMBINATIONS.collect do |combo|
      if combo == combo.select{|i| @board[i] == "X"}
        true
      elsif combo == combo.select{|i| @board[i] == "O"}
        true
      else
        false
      end
    end
    if combos.any?
      WIN_COMBINATIONS[combos.index(true)]
    else
      nil
    end
  end

  def full?
    @board.none?{|position| position == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    display_board
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
