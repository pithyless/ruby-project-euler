require './euler'

MAX = 100 - 1

maxsum = 0
2.upto(MAX) do |a|
  2.upto(MAX) do |b|
    t = (a**b).digits.sum
    maxsum = t if t > maxsum
  end
end

p maxsum