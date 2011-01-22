lim = 100
cnt = 0

1.upto(lim) do |n|
  1.upto(lim) do |pow|
    p = n**pow
    l = p.to_s.length
    cnt += 1 if l == pow
  end
end

p cnt