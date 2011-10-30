$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

# pro ruby 1.8.6
require 'symbol'
require 'calculator'

print "Zadejte 1. cislo: "
prvni = gets.chomp.to_i

print "Zadejte 2. cislo: "
druhe = gets.chomp.to_i

print "Zadejte operaci: "
op = gets.chomp
puts

calc = Calculator.new(prvni, druhe, op).calculate
calc.print_result
