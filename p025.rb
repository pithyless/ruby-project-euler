def fibonacci_each
  i, j = 0, 1
  loop do
    yield i
    i, j = j, i + j
  end
end

def solve (max)
  cnt = 0
  fibonacci_each do |f|
    return cnt if f.to_s.length >= max
    cnt += 1
  end
end

puts solve 1000