number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# if the `next` statement was placed after puts, it wouldn't do anything.
# every number would be printed
