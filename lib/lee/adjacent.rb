module Lee

  def self.point_on_board?(board, point)
    point.x >= 0 && point.y >= 0 && point.x < board.width && point.y < board.height
  end

  def self.route_on_board?(board, route)
    point_on_board?(board, route.a) && point_on_board?(board, route.b)
  end
  
  def self.unsafe_adjacent(board, point)
    [
      Point.new(point.x - 1, point.y),
      Point.new(point.x, point.y - 1),
      Point.new(point.x + 1, point.y),
      Point.new(point.x, point.y + 1)
    ]
  end

  def self.adjacent(board, point)
    unsafe_adjacent(board, point).select { |adjacent| point_on_board?(board, adjacent) }
  end

end
