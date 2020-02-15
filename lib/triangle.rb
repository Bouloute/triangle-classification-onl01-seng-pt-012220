require ('pry')
class Triangle

  def initialize(side_a, side_b, side_c)

    @sides = [side_a, side_b, side_c]
  end

  def kind

    side_a, side_b, side_c = @sides[0], @sides[1], @sides[2]
    if    ((side_a == side_b) && (side_a == side_c))
      kind = :equilateral
    elsif ((side_a == side_b) || (side_a == side_c) || (side_b == side_c))
      kind = :isosceles
    elsif ((side_a != side_b) && (side_a != side_c) && (side_b != side_c))
      kind = :scalene
    end

#binding.pry

    if kind == nil || @sides.find{|side| negative?(side)} != nil

        raise TriangleError
    else
      return kind
    end
  end

  def negative?(number)
    number <= 0
  end

  class TriangleError  < StandardError
  
  end
end


puts Triangle.new(0, 0, 0).kind
