class Triangle
  # write code here
  attr_reader :side_a, :side_b, :side_c

  @@all = []

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    @@all << self
  end

  def self.all
    @@all
  end

  def kind
    if side_a <= 0 || side_b <= 0 || side_c <= 0
      begin
        raise TriangleError
      recuse TriangleError => error
        puts error.message
      end
    elsif side_a >= side_b + side_c || side_b >= side_a + side_c || side_c >= side_b + side_a
      begin
        raise TriangleError
      recuse TriangleError => error
        puts error.message
      end
    end

    if side_a == side_b && side_b == side_c
      :equilateral
    elsif side_a == side_b || side_b == side_c || side_c == side_a
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    # triangle error code
    def message
      "illiegal"
    end
  end
end
