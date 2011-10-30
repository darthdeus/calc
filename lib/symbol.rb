# Dodefinovani Symbol#to_proc pokud program bezi na Ruby 1.8.6, 
# kde funkce neni dostupna
if RUBY_VERSION == '1.8.6'
  class Symbol
    def to_proc
      Proc.new { |obj, *args| obj.send(self, *args) }
    end
  end
end