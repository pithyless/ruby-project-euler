require './euler'

max = 28123
# max = 20162

abnums = (1..max).select { |i| i.abundant? }

absums = []
abnums.each do |i|
  abnums.each do |j|
    break if i+j > max
    absums << i + j
  end
end

sol = (0..max).to_a - absums

p sol.sum
