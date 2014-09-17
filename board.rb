require_relative 'chess.rb'

class StartPositionError < StandardError
end

class EndPositionError < StandardError
end

class Board

  UNICODE_BOX = {
    letters: "    a   b   c   d   e   f   g   h    ",
    top: "  ┏━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┓  ",
    thick_vertical: " ┃ ",
    thin_vertical: " │ ",
    middle_horizontal: "  ┠───┼───┼───┼───┼───┼───┼───┼───┨  ",
    bottom: "  ┗━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┛  "
  }

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_board
  end

  def [](position)
    col, row = position
    @grid[row][col]
  end

  def []=(position, value)
    col, row = position
    @grid[row][col] = value
  end

  def empty?(position)
    x, y = position
    x.between?(0,7) && y.between?(0,7) && self[position].nil?
  end

  def in_check?(color)
    king_position = find_king(color)

    enemy_pieces = @grid.flatten.select do |piece|
      next if piece.nil?
      piece.color != color
    end

    enemy_pieces.each do |piece|
      moves = piece.moves

      return true if moves.any? {|position| position == king_position}
    end

    false
  end

  def find_king(color)
    @grid.flatten.each do |piece|
      return piece.position if piece.class == King && piece.color == color
    end

    nil
  end

  def move(start, end_pos)
    piece = self[start]
    if piece.nil?
      raise StartPositionError.new
    end

    unless piece.moves.include?(end_pos)
      raise EndPositionError.new
    end

    piece.position = end_pos

    nil
  end

  def populate_board
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    pieces.each_with_index do |piece, index|
      piece.new([index, 0], self, :black)
      Pawn.new([index, 1], self, :black)

      piece.new([index, 7], self, :white)
      Pawn.new([index, 6], self, :white)
    end

    nil
  end

  def display

#
#     ─	━	│	┃	┄	┅	┆	┇	┈	┉	┊	┋	┌	┍	┎	┏
#   	┐	┑	┒	┓	└	┕	┖	┗	┘	┙	┚	┛	├	┝	┞	┟
#   	┠	┡	┢	┣	┤	┥	┦	┧	┨	┩	┪	┫	┬	┭	┮	┯
#   	┰	┱	┲	┳	┴	┵	┶	┷	┸	┹	┺	┻	┼	┽	┾	┿
#   	╀	╁	╂	╃	╄	╅	╆	╇	╈	╉	╊	╋	╌	╍	╎	╏
#   	═	║	╒	╓	╔	╕	╖	╗	╘	╙	╚	╛	╜	╝	╞	╟
#   	╠	╡	╢	╣	╤	╥	╦	╧	╨	╩	╪	╫	╬	╭	╮	╯
#   	╰	╱	╲	╳	╴	╵	╶	╷	╸	╹	╺	╻	╼	╽	╾	╿
#
#
#          a   b   c   d   e   f   g   h
#        ┏━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┓
#      8 ┃   │   │   │   │   │   │   │   ┃ 8
#        ┠───┼───┼───┼───┼───┼───┼───┼───┨
#      7 ┃   │   │   │   │   │   │   │   ┃ 7
#        ┠───┼───┼───┼───┼───┼───┼───┼───┨
#      6 ┃   │   │   │   │   │   │   │   ┃ 6
#        ┠───┼───┼───┼───┼───┼───┼───┼───┨
#      5 ┃   │   │   │   │   │   │   │   ┃ 5
#        ┠───┼───┼───┼───┼───┼───┼───┼───┨
#      4 ┃   │   │   │   │   │   │   │   ┃ 4
#        ┠───┼───┼───┼───┼───┼───┼───┼───┨
#      3 ┃   │   │   │   │   │   │   │   ┃ 3
#        ┠───┼───┼───┼───┼───┼───┼───┼───┨
#      2 ┃   │   │   │   │   │   │   │   ┃ 2
#        ┠───┼───┼───┼───┼───┼───┼───┼───┨
#      1 ┃   │   │   │   │   │   │   │   ┃ 1
#        ┗━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┛
#          a   b   c   d   e   f   g   h

    puts UNICODE_BOX[:letters]
    puts UNICODE_BOX[:top]

    @grid.each_with_index do |row, i|

      line = "#{8 - i}" + UNICODE_BOX[:thick_vertical]

      row.each do |piece|
        square = piece.nil? ? " " : piece.unicode
        line += square + UNICODE_BOX[:thin_vertical]
      end

      3.times { line.chop! }
      puts line + UNICODE_BOX[:thick_vertical] + "#{8 - i}"
      puts UNICODE_BOX[:middle_horizontal]
    end

    puts UNICODE_BOX[:bottom]
    puts UNICODE_BOX[:letters]

    nil
  end

end

board = Board.new
board.display