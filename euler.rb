
class String
  def palindrome?
    self == self.reverse
  end
end

class Integer
  def digits
    self.to_s.split(//).map { |x| x.to_i }
  end
end

class Array
  def sum
    self.inject (0) { |total, e| total + e }
  end
end