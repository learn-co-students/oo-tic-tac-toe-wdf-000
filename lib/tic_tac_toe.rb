class TicTacToe
  def initialize
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
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(index, player = 'X')
    @board[index.to_i - 1] = player
  end

  def position_taken?(index)
    @board[index]== "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !position_taken?(index.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
      if !valid_move?(input)
        turn
      end
    move(input, current_player)
    display_board
  end

  def turn_count
    @board.count { |letter| letter == 'X' || letter == 'O' }
  end

  def current_player
    if turn_count % 2 == 0
      return 'X'
    else
      return 'O'
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo| 
      @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && position_taken?(combo[0])
    end 
  end

  def full?
    turn_count == 9 ? true : false
  end

  def draw? 
    if turn_count == 9 && !won? 
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won? 
      return true
    else 
      return false
    end
  end

  def winner
    if winner = won?
      @board[winner[0]]
    end
  end

  def play
    until over? 
      turn
    end
    if draw?
      puts "Cats Game!"
      else
      puts "Congratulations #{winner}!"
    end
  end

end


