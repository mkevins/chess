# coding: utf-8
class Knight < SteppingPiece
  DELTAS = [
             [-1,  2], [ 1,  2],
    [-2,  1],                   [ 2,  1],
    [-2, -1],                   [ 2, -1],
             [-1, -2], [ 1, -2]
  ]

  def unicode
    self.color == :white ? "\u2658" : "\u265E"
  end
end
