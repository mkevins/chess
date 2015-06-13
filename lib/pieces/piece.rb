# coding: utf-8
class Piece
  attr_reader :board, :color, :position

  def initialize(position, board, color)
    @board = board
    @color = color
    self.position = position
  end

  def position=(position)
    @position = position
    board[position] = self
  end

  def dup(board = nil)
    raise "hell" if board.nil?
    self.class.new(self.position.dup, board, self.color)
  end

  def moves
    possible_moves = self.possible_moves
    possible_moves = check_on_board(possible_moves)
    possible_moves = check_color(possible_moves)
  end

  def valid_moves
    valids = self.moves.select do |move|
      !move_into_check?(move)
    end

    valids
  end

  private
  def check_on_board(possible_moves)
    result = possible_moves.select do |move|
      x, y = move
      x.between?(0, 7) && y.between?(0, 7)
    end

    result
  end

  def check_color(possible_moves)
    result = possible_moves.select do |move|
      board.empty?(move) || board[move].color != self.color
    end

    result
  end

  def move_into_check?(position)
    #returns true if this move puts us in check
    board_dup = self.board.board_dup

    board_dup.move!(self.position, position)
    board_dup.in_check?(self.color)
  end
end
