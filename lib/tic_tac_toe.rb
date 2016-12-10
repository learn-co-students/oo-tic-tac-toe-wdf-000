class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board #if a @ is used do I always equal it to itself??
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

  def move(user_input, token = "X")
    @board[user_input.to_i - 1] = token
  end


  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !position_taken?(user_input.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
#    index = user_input.to_i - 1
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each{|character| count+=1 if character == "X" || character == "O"}
    count
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
      win_index_1 = win_combination[0] #grabs 0, 3, 6 etc.
      win_index_2 = win_combination[1] #grabs 1, 4, 7 etc.
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination #returns win_comb that won
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination #returns win_comb that won
      end
    end
    false
  end

  def full?
    @board.none?{|move| move == " "}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    if won? == true || draw? == true || full? == true
      return true
    end
  end

  def winner
    if won? #if this statement is true
      @board[won?[0]] #output this method
    else
      nil
    end
  end

  def play
    while !over? && !won?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end
