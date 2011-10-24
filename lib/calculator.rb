class Calculator
  attr_accessor :first, :second, :result
  
  def initialize(first, second, op)
    raise ArgumentError unless first.integer? && second.integer?
    raise ArgumentError unless %w{+ - *}.include?(op)

    @first = first
    @second = second
    @op = op
  end
  
  def add
    @result = @first + @second
  end

  def substract
    @result = @first - @second
  end
  
  def multiply
    @result = @first * @second
  end
  
  def output
    [@first.to_s, (@op.to_s + @second.to_s)]
  end
  
  
end