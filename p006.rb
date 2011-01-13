require './euler'

sum  = (1..100).to_a.sum
sqrs = (1..100).map {|i| i**2}

puts (sum ** 2) - sqrs.to_a.sum