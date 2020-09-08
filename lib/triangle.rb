class Triangle
  attr_reader :first, :second, :third
  def initialize(first, second, third)
    @first = first
    @second = second
    @third = third
  end

  def kind
    if @first + @second <= @third || @first + @third <= @second || @third + @second <= @first || @first < 0 || @second < 0 || @third < 0
      raise TriangleError
    end

    if @first == @second && @first == @third
      :equilateral
    elsif @first == @second || @first == @third || @third == @second
      :isosceles
    else
      :scalene
    end

  end

  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end
  end
end