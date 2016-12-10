class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def game
    @board
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

  def move(input, token="X")
    @board[input.to_i - 1] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(input)
  input.to_i.between?(1,9) && !position_taken?(input.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
#    index = input(index)
    if valid_move?(input)
      move(input, current_player)
      current_player
      display_board
    else
      turn
    end
  end

  def turn_count
    turns = 0
    @board.each do |turn|
    if turn == "X" || turn == "O"
      turns += 1
    end
  end
    return turns
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
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
    false
  end

  def full?
    if @board.any? {|position| position == " "}
      false
    else
      true
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end


  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if win = won?
      @board[win.first]
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
