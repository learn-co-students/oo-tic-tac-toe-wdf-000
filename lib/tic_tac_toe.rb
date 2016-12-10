class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(input, player = "X")
        input = input.to_i - 1
        @board[input] = player
    end

    def position_taken?(input)

      if (@board[input] == "X" || @board[input] == "O")
        return true
      else
        return false
      end
    end

    def valid_move? (input)
      input = input.to_i - 1
      if (!position_taken?(input) && input >= 0 && input < 9   )
         return true
      else
        return false
      end
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.chomp

      if (valid_move?(input))
          c  = current_player
          move( input, c )
          display_board
      else

        turn

      end


    end



    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

      def turn_count
        @board.count{|token| token == "X" || token == "O"}
      end

      def won?
        WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = @board[win_index_1] # load the value of the board at win_index_1
          position_2 = @board[win_index_2] # load the value of the board at win_index_2
          position_3 = @board[win_index_3] # load the value of the board at win_index_3

        if (position_1 == "X" && position_2 == "X" && position_3 == "X")
          return win_combination
        end

          if  (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combination
          end


       end

       return false
      end

        def full?
          @board.each {|b| return false if b == " "}

          return true


        end

        def draw?
          if (!won?  && full? )

            return true
          else
            return false
         end
       end


         def over?
        if (won?  || full?  || draw? )
          return true
       else
         return false
       end
        end


        def winner
          if (won? )
            a = won?
            return @board[a[0]]
          else
            return nil
          end
        end

          def play

            while !over?
              turn
            end

            if won?
              puts "Congratulations #{winner }!"
            elsif draw?
              puts "Cats Game!"
            end

        end

end
