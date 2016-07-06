class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    (1..9).include?(index.to_i) ? index.to_i-1 : false
  end

  def move(play, index)
    @board[input_to_index(play)] = index
  end

  def position_taken?(index)
    @board[index]== "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    if input_to_index(index)
       !position_taken?(input_to_index(index))
     else
       false
    end
  end
  
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
  
  def won?
    WIN_COMBINATIONS.each do |win|
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win
    end
    end
    return false
  end
  
  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end
  
  def winner
    winning = won?
    if winning
     position = winning.first
     return @board[position]
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

