class Triangle

  attr_reader :l, :r, :b
  
  def initialize(l, r, b)
        @l=l
        @r=r
        @b=b
  end

  def kind
    triangle
    if l==r && r==b
      :equilateral
    elsif l==r || r==b || l==b
      :isosceles
    else
      :scalene
    end

  end

  def triangle 
    triangle = [(l + r > b), (l + b > r), (r + b > l)]
    [l,r,b ].each do |side| triangle << false if side <= 0 
      raise TriangleError if triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end
end
