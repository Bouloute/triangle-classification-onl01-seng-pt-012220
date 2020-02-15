require ('pry')
class Triangle

  def initialize(side_a, side_b, side_c)

    @sides = [side_a, side_b, side_c]

    if    ((side_a == side_b) && (side_a == side_c))
      @kind = :equilateral
    elsif ((side_a == side_b) || (side_a == side_c) || (side_b == side_c))
      @kind = :isosceles
    elsif ((side_a != side_b) && (side_a != side_c) && (side_b != side_c))
      @kind = :scalene
    end
  end

  def kind
  #  binding.pry
    if @kind == nil || @sides.find{|side| negative?(side)} != nil
      begin
        raise TriangleError
      rescue TriangleError => error
          puts error.message
      end
    else
      return @kind
    end
  end

  def negative?(number)
    number <= 0
  end

  class TriangleError  < StandardError
    def message
      "TriangleError"
    end
  end
end


puts Triangle.new(0, 0, 0).kind
