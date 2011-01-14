require './euler'

letters = ('A'..'Z').to_a
numbers = (1..26).to_a
h = Hash[*letters.zip(numbers).flatten]

words = File.read('words.txt')[1..-2].split(/","/)

@max_num = 1
@max_n  = 1
@tris = {1 => 1}
def is_triangle?(num)
  while num > @max_num
    @max_n += 1
    @max_num = (0.5 * @max_n * (@max_n + 1)).round
    @tris[@max_num] = @max_n
  end
  @tris.has_key?(num)
end

solution = 0
words.each do |w|
  num = (w.split(//).map {|c| h[c]}).sum
  solution += 1 if is_triangle?(num)
end
p solution