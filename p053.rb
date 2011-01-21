require './euler'

class Integer
  def nCr(r)
    self.factorial / (r.factorial * (self-r).factorial)
  end
end

cnt = 0
1.upto(100).each do |n|
  (n-1).downto(1).each do |r|
    cnt += 1 if n.nCr(r) > 1_000_000
  end
end

puts cnt