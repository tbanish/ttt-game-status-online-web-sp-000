# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]


def won?(board)
  empty_board = board.all?(" ") || board.all?("")
	WIN_COMBINATIONS.each do |win_combo|
	  if win_combo.all? {|index| board[index] == "X"} || win_combo.all? {|index| board[index] == "O"}
			return win_combo
		elsif empty_board
		  return false
		elsif full?(board) && (!win_combo.all? {|index| board[index] == "X"} || !win_combo.all? {|index| board[index] == "O"})
		  return false
		end
	end
end


def full?(board)
  if board.include?(" ") || board.include?("")
    return false
  else
    return true
  end
end


def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  WIN_COMBINATIONS.each do |win_combo|
    if won?(board) && win_combo.all? {|index| board[index] == "X"}
      puts "X"
    elsif won?(board) && win_combo.all? {|index| board[index] == "O"}
      puts "O"
    else
      return nil
    end
  end
end  
  
  
  
      
      


      
    
