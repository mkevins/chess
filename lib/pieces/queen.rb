# coding: utf-8
class Queen < SlidingPiece
  def deltas
    SlidingPiece::DIAGONAL_DELTAS + SlidingPiece::ORTHOGONAL_DELTAS
  end

  def unicode
    self.color == :white ? "\u2655" : "\u265B"
  end
end
