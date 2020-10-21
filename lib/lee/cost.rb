module Lee

  def self.cost(depth)
    2**depth
  end

  def self.cost_solutions(board, solutions)
    depth = {}
    depth.default = 0

    cost = 0

    solutions.values.each do |solution|
      solution.each do |point|
        point_depth = depth[point]
        cost += cost(point_depth)
        depth[point] = point_depth + 1
      end
    end

    [cost, depth.values.max]
  end

end
