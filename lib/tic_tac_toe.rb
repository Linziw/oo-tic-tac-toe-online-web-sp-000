class TicTacToe
  
  def initialize
    @board = Array.new(9," ")
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

def input_to_index(input)
  index = input.to_i - 1
end

def move(index, token="X")
  @board[index] = token
end

def position_taken?(index)
 if @board[index] == " " || @board[index] == "" || @board[index] == nil
   return false
 else true
 end
end

def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)
    return true
  else false
 end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if valid_move?(index)
  move(index, token = current_player)
  display_board
else
  turn
end
end

def turn_count
  new_array = @board.reject {|location| location == " "}
  new_array.length
end

def current_player
  turn_count.even? ? "X":"O"
end

def won?
  WIN_COMBINATIONS.find do |combo|
    if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      return combo
  else
    false
end
end
end

def full?
  if @board.include?(" ")
    return false
  else 
    return true
end
end

def draw?
  full? && !won?
end

def over?
  won? || draw? || full?
end

def winner
  if won? == nil
    return nil
  else
    @board[won?[0]]
end
end

  def play
  until over?
 turn
  end
  if won?
 puts "Congratulations #{winner}!"
  else if draw?
  puts "Cat's Game!"
  end
  end

end

end