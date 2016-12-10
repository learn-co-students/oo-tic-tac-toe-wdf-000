class TicTacToe

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

  def initialize(board = " ")
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(index, token = "X")
    index -= 1
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == nil)
  end

  def valid_move?(index)
    
    if(index.class == String)
      index = index.to_i
    end

    index -= 1
    valid = index.between?(0,8)

    !(position_taken?(index) == true || valid == false)

  end

  def turn
    puts "Please enter 1-9:"
    input = gets

    if(input.class == String)
      input = input.to_i
    end

    token = current_player
    
    if(valid_move?(input))
      move(input, token)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |element|
      if(element == "X" || element == "O")
        counter += 1
      end
    end
    counter
  end

  def current_player
    if(turn_count.odd?)
      "O"
    else
      "X"
    end
  end

  def won?
    empty = @board.all? do |element|
      element == " "
    end

    if(empty)
      return !empty

    else
      WIN_COMBINATIONS.any? do |win_combo|
        win_index1 = win_combo[0]
        win_index2 = win_combo[1]
        win_index3 = win_combo[2]

        pos1 = @board[win_index1]
        pos2 = @board[win_index2]
        pos3 = @board[win_index3]

        if((pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O"))
          return win_combo
        else
          false
        end
      end
    end
  end

  def full?
    !(@board.include?(" "))
  end

  def draw?
   if(!won? && full?)
     true
   elsif(!won? && !full?)
     false
   else
     false
   end
  end

  def over?
    (won?  || draw? || full?)
  end

  def winner
    if(!won?)
      return nil
    else
      w_array = won?
      pos1 = w_array[0]

      if(@board[pos1] == "X")
        "X"
      else
        "O"
      end
    end
  end

  def play
    until(over?)
      turn
      turn_count
    end

    if(won?)
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end