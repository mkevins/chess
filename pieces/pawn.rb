# coding: utf-8
class Pawn < Piece
  def initialize(position, board, color)
    super(position, board, color)
    @starting_position = position
  end

  def possible_moves
    x, y = self.position
    possibilities = []

    possibility = [x, white_or_black(y, 1)]
    possibilities << possibility if board.empty?(possibility)

    if self.position == @starting_position
      possibility = [x, white_or_black(y, 2)]
      possibilities << possibility if board.empty?(possibility)
    end

    diags = [
      [x - 1, white_or_black(y, 1)],
      [x + 1, white_or_black(y, 1)]
    ]

    possibilities += diags.select do |diag|
      !self.board.empty?(diag)
    end

    possibilities
  end

  def unicode
    self.color == :white ? "\u2659" : "\u265F"
  end

  private
  def white_or_black(y, dy)
    if self.color == :white
      y - dy
    else
      y + dy
    end
  end
end
