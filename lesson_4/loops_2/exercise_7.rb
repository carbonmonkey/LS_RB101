# 5.times do |index|
#   puts index
#   break if index >= 2
# end

# will print 5 values (0..4)
# 5.times do |index|
#   puts index
#   break if index == 4
# end

# will print 1 value (0)
5.times do |index|
  puts index
  break if index < 7
end
