require './euler'

class Integer
  def amicable?
    a = self.divisors
    return false if a.length < 3
    a = a[0..-2].sum
    b = a.divisors[0..-2].sum
    self == b and self != a
  end
end

MAX = 10_000 - 1
xs = (1..MAX).select { |x| x.amicable? }
p xs.sum
