MAX = 1_000_000 - 1

def chain_length(n, cache)
  cnt = 1
  until cache.include? n 
    cnt += 1
    n = n.even? ? n/2 : 3*n+1
  end
  cnt + cache[n]
end

maxseed = 0
maxlen  = 0
cache = {1 => 0}

1.upto(MAX) do |i|
  len = chain_length i, cache
  cache[i] = len
  if len > maxlen
    maxlen = len
    maxseed = i
  end
end

p [maxseed, maxlen]