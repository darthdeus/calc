class Calculator
  attr_accessor :first, :second, :result, :output
  
  def initialize(first, second, op)
    raise "Zadejte cislo" unless first.integer? && second.integer?
    raise "Neplatna operace" unless %w{+ - *}.include?(op)

    @first = first
    @second = second
    @op = op
    @output = []
  end

  def calculate
    @output << @first << (@op.to_s + @second.to_s)
    
    case @op
      when "+" then @result = @first + @second
      when "-" then @result = @first - @second
      when "*" then 
        @result = @first * @second
        if @second.to_s.length > 1
          @output << '-'
          @second.to_s.reverse.each_char.with_index do |char, i|
            @output << (@first * char.to_i).to_s + (' ' * i)
          end
          
        end
    end
    @output << '-'
    @output << @result
    self # pro zjednoduseni chain callu    
  end
  
  def output
    @output.map(&:to_s)
  end
  
  def total_width
    @total_width ||= output.map(&:length).max
  end
  
  def print_output
    output.map { |line| (line =~ /^\-$/) ? ('-' * total_width) : line.rjust(total_width) }
  end
  
  def print_result
    puts print_output.join("\n")
  end
end