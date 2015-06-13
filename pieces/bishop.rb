# coding: utf-8
class Bishop < SlidingPiece
  def deltas
    SlidingPiece::DIAGONAL_DELTAS
  end

  def unicode
    self.color == :white ? "\u2657" : "\u265D"
  end
end
