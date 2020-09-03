require 'pry'

class Triangle

  attr_reader :x, :y, :z
  
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def kind
    if self.triangle_inequality? && self.sides_greater_0?
      true_triangle = "This real triangle is"
    else
        raise TriangleError
    end
      if self.x == self.y && self.x == self.z
        puts "#{true_triangle} an equilateral triangle."
      elsif self.x != self.y && self.y != self.z && self.z != self.x
        puts "#{true_triangle} a scalene triangle."
      else puts "#{true_triangle} an isosceles triangle."
      end
  end

  def triangle_inequality?
    self.x + self.y > self.z && self.y + self.z > self.x && self.z + self.x > self.y
  end

  def sides_greater_0?
    self.x > 0 && self.y > 0 && self.z > 0
  end
  
  class TriangleError < StandardError
    def message
      puts "This is not a real triangle."
    end
  end
end

equilateral = Triangle.new(10, 10, 10)
isosceles = Triangle.new(10, 10, 4)
scalen = Triangle.new(10, 8, 4)
nonexistent1 = Triangle.new(0, 10, 4)
nonexistent2 = Triangle.new(2, 6, 10)

binding.pry
0
