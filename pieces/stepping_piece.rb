# coding: utf-8
class SteppingPiece < Piece

  def possible_moves
    x, y = self.position

    moves = self.class::DELTAS.map do |delta|
      dx, dy = delta
      [x + dx, y + dy]
    end

    moves
  end

end
