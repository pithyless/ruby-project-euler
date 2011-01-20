require 'prime'

class String
  def palindrome?
    self == self.reverse
  end
end

class Integer
  def digits
    self.to_s.split(//).map{ |c| c.to_i }
  end
  
  def sum_of_divisors
    n = self.to_i
    divisors = [1]
    2.upto(n**0.5) do |i|
      if 0 == n%i
        divisors << i
        divisors << n/i unless n/i == i
      end
    end

    divisors.inject(0){|sum,i| sum += i}
  end
  
  def abundant?
    sum_of_divisors > self.to_i
  end
  
  def factorial
    return 1 if x < 2
    return 2 if x == 2
    x = self
    (self-1).downto(2) { |i| x *= i}
    x
  end
  
  def pandigital?(n = 9)
    self.digits.sort ==  (1..n).to_a
  end

  def divisors
    return [1] if self < 2
    primes, powers = self.prime_division.transpose
    exponents = powers.map{|i| (0..i).to_a}
    divisors = exponents.shift.product(*exponents).map do |powers|
      primes.zip(powers).map{|prime, power| prime ** power}.inject(&:*)
    end
    divisors.sort
  end
  end

class Array
  def sum
    self.inject(0) { |total, e| total + e }
  end
  
  # def product
  #   self.inject(1) { |t, e| t * e }
  # end
  
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


class Fixnum  
  def nth_prime
    return [2,3,5,7,11,13,17,19][self-1] if self < 9
    k = 8
    p = 19
    while k < self
      p += 2
      while not p.prime?
        p += 2
      end
      k += 1
    end
    p
  end
  
  def prime?
    sp = _silly_prime?
    return sp unless sp.nil?
    
    sqrt = self ** 0.5
    primes = Sieve.get_primes_to sqrt
    primes.each do |t|
      return true if t > sqrt
      return false if 0 == self % t
    end
    
    return true
  end
  
  def _silly_prime?
    return [2,3,5,7,11,13,17,19].member?(self) if self < 20
    
    ds = self.digits
    # 2s and 5s
    return false if [0,2,4,5,6,8].member?(ds[-1])
    # 3s
    return false if 0 == ds.sum % 3
    
    return nil
  end
end

class Sieve
  def self.get_primes_to max
    series = (2..max).to_a
    sqrt  = max**0.5

    0.upto series.length do |k|
      next unless series[k]

      candidate = series[k]
      wipe = (candidate**2)-2
      while wipe <= max
        series[wipe] = nil
        wipe += candidate
      end
    end

    series.compact
  end
end