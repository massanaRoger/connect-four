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
end
