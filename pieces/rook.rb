# coding: utf-8
class Rook < SlidingPiece
  def deltas
    SlidingPiece::ORTHOGONAL_DELTAS
  end

  def unicode
    self.color == :white ? "\u2656" : "\u265C"
  end
end
