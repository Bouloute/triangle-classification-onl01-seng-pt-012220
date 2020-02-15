require ('pry')
class Triangle

  def initialize(side_a, side_b, side_c)

    @sides = [side_a, side_b, side_c]
  end

  def kind
#binding.pry
    if valid?
      puts "#{@sides} was considered valid"
      side_a, side_b, side_c = @sides[0], @sides[1], @sides[2]
      if    ((side_a == side_b) && (side_a == side_c))
        return :equilateral
      elsif ((side_a == side_b) || (side_a == side_c) || (side_b == side_c))
        return :isosceles
      elsif ((side_a != side_b) && (side_a != side_c) && (side_b != side_c))
        return :scalene
      end
    else
      puts "#{@sides} was considered invalid"
      raise TriangleError
    end
  end

  def valid?
    #sides cannot be negative nor 0
    if @sides.find{|side| side <= 0} != nil
      return false
    end
    #triangle inequality
    if @sides[0] + @sides[1] < @sides[2] || @sides[0] + @sides[2] < @sides[1] || @sides[1] + @sides[2] < @sides[0]
      return false
    end
    
binding.pry
    true
  end

  class TriangleError  < StandardError
  end
end
