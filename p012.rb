require './euler'

def triangle_number (n)
  (0..n).to_a.inject(:+)
end

n = 1
loop do
  n += 1
  t = triangle_number(n)
  if (cnt = t.divisors.length) > 500
    puts "#{t} => triangle(#{n}) with #{cnt} factors"
    break
  end
end

