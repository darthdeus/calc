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

  # Vypocet podle zadanych parametru.
  # Vraci samotny objekt Calculator pro zjednoduseni chain callu .new(...).calculate
  def calculate
    @output << @first << (@op.to_s + @second.to_s)
    
    case @op
      when "+" then @result = @first + @second
      when "-" then @result = @first - @second
      when "*" then 
        @result = @first * @second
        # Nasobeni pod sebou ma smysl resit jenom pokud ma druhy citatel vic nez jednu cislici
        if @second.to_s.length > 1
          @output << '-'
          # Iterace pozadu pres druhy citatel pro nasobeni pod sebou
          # Idealne by to zde slo zjednodusit na @second.to_s.reverse.each_char.with_index,
          # ale to jak jsem zjistil neni podporovano v 1.8.x
          @second.to_s.reverse.split("").each_with_index do |char, i|
            @output << (@first * char.to_i).to_s + (' ' * i)
          end          
        end
    end
    @output << '-'
    @output << @result
    self # pro zjednoduseni chain callu    
  end
  
  # Pro zjednoduseni zpracovani vysledku, prevede vsechny cisla na stringy
  def output
    @output.map(&:to_s)
  end
  
  # Delka nejdelsiho radku
  def total_width
    @total_width ||= output.map(&:length).max
  end
  
  # Vraci jednotlive radky v poli urcene pro vypsani na vystup
  def print_output
    output.map { |line| (line =~ /^\-$/) ? ('-' * total_width) : line.rjust(total_width) }
  end
  
  # Vypise kompletni vystup
  def print_result
    puts print_output.join("\n")
  end
end