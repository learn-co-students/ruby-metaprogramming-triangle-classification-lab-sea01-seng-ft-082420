class Triangle
  attr_reader :ab, :bc, :ac
  
  def initialize(ab, bc, ac)
    @ab = ab
    @bc = bc
    @ac = ac
  end

  def kind
    check_triangle
    if ab == bc && bc == ac && ac == ab
      :equilateral
    elsif ab == bc || bc == ac|| ac == ab
      :isosceles
    else 
      :scalene
    end
     

  end  

  def check_triangle
    legal_triangle = [(ab+bc>ac), (ab+ac>bc), (bc+ac>ab)]
    [ab, bc, ac].each do |side|
      legal_triangle << false if side<=0 
        raise TriangleError if legal_triangle.include?(false)
      end
  end 


  class TriangleError < StandardError
    def message 
      "This is not a real triangle"
    end 
  end


end
