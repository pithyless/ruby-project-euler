
class String
  def palindrome?
    self == self.reverse
  end
end

class Array
  def sum
    self.inject (0) { |total, e| total + e }
  end
end