class Triangle
  attr_accessor :side1, :side2, :side3, :kind

  def initialize(side1, side2, side3)
    @side1=side1
    @side2=side2
    @side3=side3
    @kind=kind
  end

  def kind
    if @side1 <= 0 or @side2 <= 0 or @side3 <= 0 or (@side1+@side2)<=@side3 or (@side1+@side3)<=@side2 or (@side3+@side2)<=@side1
      raise TriangleError
    elsif @side1==@side2 and @side1==@side3 and @side2==@side3
      @kind= :equilateral
    elsif @side1==@side2 or @side1==@side3 or @side2==@side3
      @kind= :isosceles
    elsif @side1!=@side2 and @side1!=@side3 and @side2!=@side3
      @kind= :scalene
    end
  end

  class TriangleError < StandardError
  end

end
