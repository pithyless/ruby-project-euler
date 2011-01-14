require 'set'
require './euler'

def solve
  products = Set.new
  
  "123456789".split(//).each_permutation do |orig|
    orig = orig.join
    1.upto(7) do |i|
      1.upto(8-i) do |j|
        m = orig[0,i].to_i
        n = orig[i,j].to_i
        q = orig[i+j..-1].to_i

        products << q  if m * n == q
      end
    end
  end
  products.to_a
end

puts solve.sum
