=begin
- on each iteration:
  - `number_a` and `number_b` are incremented by `0` or `1`
- use next to:
  - continue looping until either variable == 5
- print "5 was reached!" before exiting the loop
=end

number_a = 0
number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   next unless number_a >= 5 || number_b >= 5
#   puts "5 was reached!"
#   break
# end

loop do
  number_a += rand(2)
  number_b += rand(2)
  if number_a >= 5 || number_b >= 5
    puts "5 was reached!"
    break
  end
end
