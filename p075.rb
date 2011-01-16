
MAX_LENGTH = 1_500_000 + 1

triples = {}
triples.default = 0

m = 2
while (2*m*m + 2*m) < MAX_LENGTH
  n = if m.even? then 1 else 2 end
  while n < m
    if m.gcd(n) == 1
      l = 2*m*m + 2*m*n
      v = 1
      s = v * l
      while s < MAX_LENGTH
        triples[s] += 1
        v += 1
        s = v * l  
      end
    end
    n += 2
  end
  m += 1
end

good = triples.reject { |k,v| v > 1 }
p good.count
