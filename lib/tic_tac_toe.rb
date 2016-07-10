class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Third column
  [0,4,8],  # Diagonal left-right
  [2,4,6]  #Diagonal right-left
  ]

  # Display board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Move
  def move(index, current_player = "X")
    @board[index.to_i - 1] = current_player
  end

  # Position taken
  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  # Valid move
  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  # Turn
  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  # Turn_count
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  #Current_Player
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  # Won method
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      # binding.pry
      position_1 = @board[win_combination[0]] # load the value of the board at win_index_1
      position_2 = @board[win_combination[1]] # load the value of the board at win_index_2
      position_3 = @board[win_combination[2]] # load the value of the board at win_index_3

      if position_1 == " " || position_2 == " " || position_3 == " "
        false
      elsif position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return win_combination
      end
    end
    false
  end

  # Full method
  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  # Draw method
  def draw?
    !won? && full?     
  end

  #Winner
  def winner
    won? ? @board[won?[0]] : nil
  end

  # Over method
  def over?
    won? || full? || draw?
  end

  # Play method
  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"  
    elsif draw?
      puts "Cats Game!"
    end
  end


end
