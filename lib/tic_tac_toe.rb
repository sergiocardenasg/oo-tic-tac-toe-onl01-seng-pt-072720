class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize (board = nil)
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move (i, token = "X")
    @board[i] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |index|
      if position_taken?(index[0]) && @board[index[0]] == @board[index[1]] && @board[index[1]] == @board[index[2]]
        return index
      end
    end
  end

  def full?
    @board.all? { |i| i != " " }
  end

  def draw?
    draw = false
    if full? && won? == false
      draw = true
    end
  end

  def over?
    over = false
    if full? || won?
      draw = true
    end
  end

  def winner
  end

  def play
    if over? == false
      turn
    end

    if won?
      winner
    else
      over
    end
  end
end
