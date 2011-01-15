
def is_ok(a, max)
  2.upto(max) do |m|
    return false if a.to_s.split(//).sort != (a*m).to_s.split(//).sort
  end
  return true
end

def solution
  num = 1
  loop do
    num += 1
    return num if is_ok(num, 6)
  end
end

p solution
