require ('pry')
class Triangle

  def initialize(side_a, side_b, side_c)

    @sides = [side_a, side_b, side_c]
  end

  def kind

    if valid?
      side_a, side_b, side_c = @sides[0], @sides[1], @sides[2]
      if    ((side_a == side_b) && (side_a == side_c))
        kind = :equilateral
      elsif ((side_a == side_b) || (side_a == side_c) || (side_b == side_c))
        kind = :isosceles
      elsif ((side_a != side_b) && (side_a != side_c) && (side_b != side_c))
        kind = :scalene
      end
    else
      begin
        raise TriangleError
      rescue TriangleError => error
          puts error.message
      end
    else
      return kind
    end
  end

  def valid?
    if @sides.find{|side| side <= 0} != nil
      return false
    end
  end

  class TriangleError  < StandardError
    def message
      "TriangleError"
    end
  end
end


puts Triangle.new(0, 0, 0).kind
