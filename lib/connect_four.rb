# frozen_string_literal: true

# Main game class
class Game
  attr_accessor :board

  def initialize
    fill_board
  end

  def fill_board
    @board = Array.new(6) { Array.new(7, '%') }
  end

  def insert_piece(pos, piece)
    current_pos = 5
    fin = !exist_piece?(current_pos, pos)
    while !fin && current_pos >= 0
      current_pos -= 1
      fin = true unless exist_piece?(current_pos, pos)
    end
    return false unless fin

    @board[current_pos][pos] = piece
    true
  end

  def exist_piece?(pos_x, pos_y)
    @board[pos_x][pos_y] != '%'
  end

  def square_contain_win?(i, j, piece)
    right_diag = [[i,j], [i+1,j+1], [i+2,j+2], [i+3,j+3]]
    left_diag = [[i,j], [i-1,j+1], [i-2,j+2], [i-3,j+3]]
    right = [[i,j], [i,j+1], [i,j+2], [i,j+3]]
    down = [[i,j], [i+1,j], [i+2,j], [i+3,j]]
    right_diag = right_diag.filter { |pos| @board[pos[1]][pos[0]] == piece }
    left_diag = left_diag.filter { |pos| @board[pos[1]][pos[0]] == piece }
    right = right.filter { |pos| p pos; @board[pos[1]][pos[0]] == piece }
    down = down.filter { |pos| @board[pos[1]][pos[0]] == piece }
    p board
    right_diag.length == 4 || left_diag.length == 4 || right.length == 4 || down.length == 4
  end
end
