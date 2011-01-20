# Brute-force solution...  (fast enough)

MAX = 1000

sum = 0
1.upto(MAX) do |n|
  sum += n**n
end

puts sum.to_s[-10..-1]