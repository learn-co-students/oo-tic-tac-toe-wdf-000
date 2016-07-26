class TicTacToe
  
  def initialize
    @board = Array.new(9) {|i| i = " " }
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, token = "X")
    @board[input.to_i - 1] = token
  end

  def position_taken?(board = @board, position)
    board[position] == "X" || board[position] == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !position_taken?(board = @board, input.to_i - 1)
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
    display_board
  else
    turn
  end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|win_index| @board[win_index] == "X"} || win_combination.all? {|win_index| @board[win_index] == "O"}
  end
  end

  def full?
    !@board.any? {|token| token == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?.first]
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