class Triangle

  attr_accessor :side1, :side2, :side3, :type
  
  def initialize (side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if self.side1 + self.side2 <= self.side3 || self.side2 + self.side3 <= self.side1 || self.side1 + self.side3 <= self.side2
      raise TriangleError
    elsif self.side1 == self.side2 && self.side1 == self.side3
      self.type = :equilateral
    elsif self.side1 == self.side2 || self.side2 == self.side3 || self.side1 == self.side3
      self.type = :isosceles
    else
      self.type = :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "The sum of the lengths of any two sides of a triangle should always exceed the length of the third side."
    end
  end
end
