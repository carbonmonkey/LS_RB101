say_hello = true
counter = 1

while say_hello
  puts 'Hello!'
  say_hello = false if counter >= 5
  counter += 1
end
