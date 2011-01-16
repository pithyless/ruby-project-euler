
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
    return cnt if f > max
    cnt += f   if f.even?
  end
end

puts solve 4_000_000