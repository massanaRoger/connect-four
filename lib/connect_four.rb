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

  def square_contain_win?(row, col, piece)
    mask = {
      right_diag: [[row, col], [row + 1, col + 1], [row + 2, col + 2], [row + 3, col + 3]],
      left_diag: [[row, col], [row + 1, col - 1], [row + 2, col - 2], [row + 3, col - 3]],
      right: [[row, col], [row, col + 1], [row, col + 2], [row, col + 3]],
      down: [[row, col], [row + 1, col], [row + 2, col], [row + 3, col]]
    }

    !mask.filter { |key, value| row_length(value, piece) == 4 }.empty?
  end

  private

  def row_length(arr, piece)
    arr.filter { |pos| @board[pos[0]][pos[1]] == piece }.length
  end
end
