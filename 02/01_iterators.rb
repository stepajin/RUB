#!/usr/bin/env ruby

# Return array of odd elements from `array`
# in case that that a block is given, yield
# elements on odd index
# e.g.: [1,2,3,4,5,6] -> [2,4,6]
def odd_elements(array)
  res = []
  (1...array.length).step(2).each do |idx|
    elem = array[idx]
    elem = yield elem if block_given?
    res.push(elem)
  end

  res
end

puts odd_elements([1, 2, 3, 4, 5, 6])
