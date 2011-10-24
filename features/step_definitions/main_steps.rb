When /I input following formula "(\d+) ([\+\-\*]) (\d+)"/ do |first, op, second|
  type(first)
  type(second)
  type(op)
end