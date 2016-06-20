class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [6,4,2]
  ]

  def initialize(board=nil)
    @board = board || Array.new(9) {" "}
  end

  def input_to_index(position)
    position.to_i - 1
  end

  def display_board
    board = @board
    separator = "-----------"
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "#{separator}"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "#{separator}"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(position, character)
    index = input_to_index(position)
    @board[index] = character
    return @board
  end

  def position_taken?(index)
    cell = @board[index]
    return cell == "X" || cell == "O"
  end

  def valid_move?(position)
    index = input_to_index(position)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip


    if valid_move?(input.to_i)
      move(input.to_i, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each { |e|
      count += 1 if e == "X" || e == "O"
    }

    return count
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect { |e|
      e.all? { |i| @board[i] == "X" } || e.all? { |i| @board[i] == "O" }
    }
  end

  def full?
    !@board.any? { |e| e == " " }
  end

  def draw?
    won? ? false : full?
  end

  def over?
    won? || draw? || full?
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
