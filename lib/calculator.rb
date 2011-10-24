class Calculator
  attr_accessor :first, :second, :result, :output
  
  def initialize(first, second, op)
    raise ArgumentError unless first.integer? && second.integer?
    raise ArgumentError unless %w{+ - *}.include?(op)

    @first = first
    @second = second
    @op = op
    @output = []
    @output << @first << (@op.to_s + @second.to_s)
    
    case op
      when "+" then @result = @first + @second
      when "-" then @result = @first - @second
      when "*" then 
        @result = @first * @second
        if @second.to_s.length > 1
          @output << '-'
          @second.to_s.reverse.each_char.with_index do |char, i|
            @output << (@first * char.to_i).to_s + (' ' * i)
          end
          @output << '-'
        end
    end
    @output << @result
  end
  
  def output
    @output.map(&:to_s)
  end
  
  def total_width
    @total_width ||= output.map(&:length).max
  end
  
  def print_output
    output.map { |line| (line =~ /\-/) ? ('-' * total_width) : line.rjust(total_width) }
  end
  
  
end