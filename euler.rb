require 'prime'

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

  def divisors
    primes, powers = self.prime_division.transpose
    exponents = powers.map{|i| (0..i).to_a}
    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
    end
    divisors.sort
  end
end

class Array
  def sum
    self.inject (0) { |total, e| total + e }
  end
  
  def permutations
    n = self.length
    return [self] if n < 2

    self.inject([]) { |perm,i| perm + _perm(n-1,[i], self-[i]) }
  end
  def _perm(n, start, rem)
    return rem.inject([]) { |perm,i| perm << (start+[i]) && perm } if n == 1
    return rem.inject([]) { |perm,i| perm + _perm(n-1,(start+[i]),rem-[i]) }
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