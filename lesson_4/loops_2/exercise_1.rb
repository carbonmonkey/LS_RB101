count = 1

loop do
  break if count > 5
  puts "#{count} " + (count.even? ? "is even!" : "is odd!")
  count += 1
end
