WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Enter a number 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    board = move(board, index, "X")
  else
    puts "invalid"
    turn(board)
  end
end

def turn_count(board)
  iter = 0
  count = 0
  while iter < 9
    if board[iter] == "X" || board[iter] == "O"
      count += 1
    end
    iter += 1
  end
  return count
end

def current_player(board)
  turn = turn_count(board)
  if turn % 2 == 0
    return "X"
  else
    return "O"
  end
end
