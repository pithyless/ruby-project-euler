require 'prime'

sum = 0
Prime.each(2_000_000) do |p|
  sum += p
end

p sum