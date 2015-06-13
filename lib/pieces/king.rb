# coding: utf-8
class King < SteppingPiece
  DELTAS = [
    [-1, -1], [0, -1], [1, -1],
    [-1,  0],          [1,  0],
    [-1,  1], [0,  1], [1,  1]
  ]
  def unicode
    self.color == :white ? "\u2654" : "\u265A"
  end
end
