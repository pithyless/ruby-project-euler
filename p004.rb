require "./euler"

max = 0

999.downto 100 do |i|
  i.downto 100 do |j|
    p = i * j
    break if p < max
    
    max = p if p.to_s.palindrome? and p > max
  end
end

puts max