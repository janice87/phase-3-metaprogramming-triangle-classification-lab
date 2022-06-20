class Triangle
  attr_reader :a, :b, :c

  def initialize (a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle #run this method first
    if a == b && b == c
      :equilateral
    elsif 
      a == b || b == c || a == c
      :isosceles
    else
      :scalene   
    end    
  end

  def sides_larger_than_0?
    [a, b, c].all? { |side| side > 0 }
    # [a, b, c].all?(&:positive?)
  end

  def sum_of_sides?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle 
      if !sides_larger_than_0? && !sum_of_sides?
      raise TriangleError
      end    
    #raise TriangleError unless sides_larger_than_0? && sum_of_sides?      
  end

    # why doesn't this work?
    #  if !sides_larger_than_0? && !sum_of_sides?
    #   raise TriangleError
    #  end 

    class TriangleError < StandardError
    end

end
