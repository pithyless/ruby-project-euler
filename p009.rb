
def triplet?(a,b,c)
  a**2 + b**2 == c**2
end

a = b = 0

def solve(target)
  (target-3).downto 1 do |c|
    ab = target - c
    (ab-1).downto (ab/2 + 1) do |b|
      a = ab - b
      return a*b*c if triplet?(a,b,c)
    end
  end  
end

puts solve 10000