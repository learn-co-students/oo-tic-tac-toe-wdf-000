class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(board)
    @board = board
  end

  def board
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

  def move(index, current_player = "X")
    @board[index.to_i - 1] = current_player
  end
  #Why use .to_i if input is an integer?

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  # def position_taken?(board, index)
  #   (board[index] == "X" || board[index] == "O") ? true : false
  # end

  def valid_move?(index)
    index.to_i.between?(1, 9) && !position_taken?(index.to_i. - 1)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    if valid_move?(user_input)
      move(user_input, current_player)

      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  # def turn_count
  #   counter = 0
  #   @board.each do |turn|
  #     if turn == "X" || turn == "O"
  #       counter += 1
  #     end
  #   end
  #   counter
  # end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def full?
    @board.none? { |x| x == " " }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      @board[won?[0]]
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
