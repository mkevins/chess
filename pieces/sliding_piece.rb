# coding: utf-8
class SlidingPiece < Piece
  DIAGONAL_DELTAS = [[1,1], [1,-1], [-1,1], [-1,-1]]
  ORTHOGONAL_DELTAS = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  def possible_moves
    directions = self.deltas
    moves = []

    directions.each do |direction|
      x, y = self.position
      dx, dy = direction
      collision = false

      until collision
        x += dx
        y += dy
        moves << [x, y]
        collision = true unless self.board.empty?([x,y])
      end
    end

    moves
  end

end
