# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

=begin

input: hash with names and ages
output: youngest age

- names are keys as strings
- ages are integers

expected output: 10

data structure: hash, array

algorithm:

create an array of the ages
set youngest age to nil
set a counter to 0 

loop through the array
  exit the loop if the counter reaches the size of the array
  get the first age from the array
  set it as the current age
  if the youngest age is nil
    change it to the current age
  if the youngest age is more than current age
    change it to the current age
  increment the counter by 1
  start the loop over

=end

# ages_array = ages.values
# youngest = nil
# counter = 0

# while counter < ages_array.size
#   current_age = ages_array[counter]
  
#   if youngest == nil || youngest > current_age
#     youngest = current_age
#   end

#   counter +=1
# end

# p youngest

p ages.values.sort.first
