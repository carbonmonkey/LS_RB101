=begin
- write an if else statement
- executes code if `process_the_loop` is true
  - execute a loop that:
    - iterates once
    - prints "The loop was processed"
- executes other code if `process_the_loop` is false
  - print "The loop wasn't processed!"
=end

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed"
    break
  end
else
  puts "The loop wasn't processed!"
end
