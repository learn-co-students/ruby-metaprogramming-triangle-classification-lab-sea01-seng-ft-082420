require 'pry'

class Triangle

  attr_reader :x, :y, :z
  
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def kind
    self.triangle_check
      if self.x == self.y && self.x == self.z
        p :equilateral
      elsif self.x != self.y && self.y != self.z && self.z != self.x
        p :scalene
      else p :isosceles
      end
  end

  def angles
    if self.triangle_inequality? && self.sides_greater_0?
    else
      raise TriangleError
    end
      radians_opposite_x = Math.acos((self.y**2 + self.z**2 - self.x**2).to_f/(2*self.y*self.z)).round(2)
      opposite_x = (radians_opposite_x * (180/Math::PI)).round(2)
      radians_opposite_y = Math.acos((self.x**2 + self.z**2 - self.y**2).to_f/(2*self.x*self.z)).round(2)
      opposite_y = (radians_opposite_y * (180/Math::PI)).round(2)
      radians_opposite_z = Math.acos((self.x**2 + self.y**2 - self.z**2).to_f/(2*self.x*self.y)).round(2)
      opposite_z = (radians_opposite_z * (180/Math::PI)).round(2)
      puts "#{angles_of_triangle}"
      puts "For the vertex opposite to the side x, the angle is ~#{opposite_x}, for y, the angle is ~#{opposite_y}, for z, the angle is ~#{opposite_z}."
  end

  def triangle_check
    if self.triangle_inequality? && self.sides_greater_0?
    else
        raise TriangleError
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
      return "This is not a real triangle."
    end
  end
end

equilateral = Triangle.new(10, 10, 10)
isosceles = Triangle.new(10, 10, 4)
scalen = Triangle.new(10, 8, 4)
nonexistent1 = Triangle.new(0, 10, 4)
nonexistent2 = Triangle.new(2, 6, 10)