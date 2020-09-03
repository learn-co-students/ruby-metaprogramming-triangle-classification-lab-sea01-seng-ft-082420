class Triangle
  # triangle code
  attr_reader :side_1, :side_2, :side_3
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    if not_triangle
      raise TriangleError

    else
      if (@side_1 == @side_2) && (@side_2 == @side_3) 
        return :equilateral
      elsif (@side_1 == @side_2) || (@side_1 == @side_3) || (@side_2 == @side_3)
        return :isosceles
      elsif (@side_1 != @side_2) && (@side_2 != @side_3) && (@side_1 != @side_3)
        return :scalene
      end
    end

  end

  def not_triangle
    if (@side_1 <= 0) || (@side_2 <= 0) || (@side_3 <= 0)
      return true
    elsif (@side_3 >= @side_1 + @side_2) || (@side_2 >= @side_1 + @side_3) || (@side_1 >= @side_2 + @side_3)
      return true
    else
      return false
    end

  end
 
  class TriangleError < StandardError
    # triangle error code
  end


end