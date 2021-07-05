class String
def numeric?
  Float(self) != nil rescue false
end
end

class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location,token="X")
    if location.is_a?(String)
      location = location.to_i
    end
    if valid_move?(location)
      @board[(location-1)] = token
    else
      puts "That spot is already taken! Try again"
    end
  end

  def position_taken?(position)
    if (@board[position] === " ")
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    if position.is_a?(String)
      if !position.numeric?
        return false
      else
        position = position.to_i
      end
    end

    if (position >= 0 && position < 10) && (!position_taken?(position-1))
      return true
    else
      false
    end
  end

  def turn
    puts "Please enter your move: "
    new_move = gets

    until valid_move?(new_move)
      puts "Invalid move. Please try again"
      new_move = gets
    end

    move(new_move, current_player)
    display_board

  end

  def turn_count
    i = 0
    counter = 0
    while i<8
      if position_taken?(i)
        counter += 1
      end
      i += 1
    end
    return counter+1

    #@board.count {|token| position_taken?(token)}
  end

  def current_player
      if turn_count === 1
        return "X"
     elsif (turn_count.even?)
       return "O"
     else
      return "X"
     end

  #  (turn_count.even?) ? "X" : "O"
  end

  def won?
    x = 0
    while x < 7
      if (@board[WIN_COMBINATIONS[x][0]] == "X" && @board[WIN_COMBINATIONS[x][1]] == "X" && @board[WIN_COMBINATIONS[x][2]] == "X") || (@board[WIN_COMBINATIONS[x][0]] == "O" && @board[WIN_COMBINATIONS[x][1]] == "O" && @board[WIN_COMBINATIONS[x][2]] == "O")
        return WIN_COMBINATIONS[x]
      end
      x += 1
    end
    return false
  end

  def full?
    @board.all? do |token|
      token != " "
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    !!won? || draw? || full?
  end

  def winner
    (won?) ? @board[won?[0]] : puts("Bohoo no one won :( ")
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end

  end

end
