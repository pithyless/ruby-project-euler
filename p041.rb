require './euler'
require 'prime'

def solve
  9.downto(1) do |n|
    pan = (1..n).to_a.join('').reverse
    pan.split(//).permutations.each do |s|
      s = s.join('').to_i
      return s if s.prime?
    end
  end
end

puts solve

