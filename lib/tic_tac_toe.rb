class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
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

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # Helper Method
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player)
    @board[index.to_i - 1] = player
  end

  def valid_move?(index)
    index.to_i.between?(1, 9) && !position_taken?(index.to_i - 1)
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_set|
      if @board[win_set[0]] != " " && (@board[win_set[0]] == @board[win_set[1]] && @board[win_set[1]] == @board[win_set[2]])
        return win_set
      end
    end
    return false
  end

  def full?
    @board.all? {|spot| spot != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

end
