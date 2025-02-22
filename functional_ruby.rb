require 'pry'

def e
  exit
end

# Basic functional patterns in ruby
# Avoiding changing state
# Write pure functions
# Immutable data
# don't use attr_accessor, and only use attr_reader
# methods that change objects:
#   any that end in ! | delete | update | etc.

def clone_string(string)
  string.dup
end

def print_both(a, b)
  p a
  p b
end

str = "abcd"
dup = clone_string(str)

print_both str, dup


def all_elements_differ_from_first?(arr)
  first_element = arr.shift

  arr[1..-1].all? { |n| n != first_element }
end

arr  = [1, 3, 5, 7, 9]
p all_elements_differ_from_first?(arr)

def add(a, b)
  a + b
end

# todo read rb docs on .curry
add_five = method(:add).curry[5]

p addition_results = [
  add_five.call(5),
  add_five.call(10)
]

list = (1..10)

greater_than = ->(x, y) { y > x }.curry

p list.select(&greater_than.(5))
p list.select(&greater_than.(8))

divisible_by = ->(x, y) { y % x == 0}.curry

p list.select(&divisible_by.(5))
p list.select(&divisible_by.(2))

# pipeline operator
def up(str)
  str.upcase
end

def concat_with_self(str, n)
  puts str, n
  if n == 0
    str
  else
    concat_with_self(str + str, n - 1)
  end
end

string = "test"

modified = string
  .then { up _1 }
  .then { |str| str[0..2]}
  .then { concat_with_self(_1, 3)}

p modified

# pry
