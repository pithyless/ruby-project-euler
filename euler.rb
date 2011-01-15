
class String
  def palindrome?
    self == self.reverse
  end
end

class Integer
  def digits
    self.to_s.split(//).map { |x| x.to_i }
  end
  
  def factorial
    x = self
    (self-1).downto(2) { |i| x *= i}
    x
  end
  
  def pandigital?(n = 9)
    self.digits.sort ==  (1..n).to_a
  end
  
  # def mygcd(other)
  #   min = self.abs
  #   max = other.abs
  #   while min > 0
  #     tmp = min
  #     min = max % min
  #     max = tmp
  #   end
  #   max
  # end
end

class Array
  def sum
    self.inject (0) { |total, e| total + e }
  end

  def each_permutation(&blockproc)
    a = []
    self.each do |c|
      a.push(c)
    end
    n = a.length
    p = Array.new(n+1,0)
    i = 1

    blockproc.call(a) 
    
    while i < n do
      if p[i] < i
        j = 0
        j = p[i] if (i % 2) == 1
        t = a[j]
        a[j] = a[i]
        a[i] = t
        p[i] = p[i] + 1
        i = 1
        blockproc.call(a) 
      else
        p[i] = 0
        i = i + 1
      end
    end
  end
end