class Triangle
  attr_reader :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    if self.impossible?([side_1, side_2, side_3])
      raise TriangleError
    elsif side_1 == side_2 && side_2 == side_3
      return :equilateral
    elsif side_1 == side_2 || side_2 == side_3 || side_3 == side_1
      return :isosceles
    else
      return :scalene
    end
  end

  def impossible?(side_array)
    side_array.length.times do
      side = side_array.shift
      if side >= side_array[0] + side_array[1] || side <= 0
        return true
      end
      side_array << side
    end
    return false
  end

  class TriangleError < StandardError

  end
end
