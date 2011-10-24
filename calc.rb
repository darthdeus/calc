#!/usr/bin/env ruby

print "Zadejte 1. cislo: "
prvni_input = gets.chomp
print "Zadejte 2. cislo: "
druhe_input = gets.chomp
print "Zadejte operaci: "
operace = gets.chomp
puts

prvni, druhe = prvni_input.to_i, druhe_input.to_i

vysledek = nil
output = []
case operace
  when "+" then 
    vysledek = prvni + druhe
    output << vysledek.to_s
  when "-" then 
    vysledek = prvni - druhe
    output << vysledek.to_s
  when "*" then 
    vysledek = prvni * druhe
    if druhe_input.length > 1
      druhe_input.reverse.each_char.with_index do |char, i|
        offset = (" " * i)
        output << (prvni * char.to_i).to_s + offset
      end
      output << "-" * (output.map(&:length).max)
    end
    output << vysledek.to_s
  else fail "Neplatny operator"
end

if output[-1] =~ /-{2,}/
  delka = output[-2].length
else
  delka = [prvni_input.length, druhe_input.length + 1, vysledek.to_s.length].max
end


puts prvni_input.rjust(delka)
puts (operace + druhe_input).rjust(delka)
puts "-" * delka
puts output.map { |line| line.rjust(delka) }.join("\n")
  
# vysledek = eval("#{prvni}#{operace}#{druhe}")
# puts vysledek.to_s.rjust(delka)


