# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

=begin

input: a hash with names and ages
output: a hash with names and ages less than 100

- keys are names as strings
- values are ages as integers
- remove key value pairs with ages greater than 100

expected output:
{ "Herman" => 32, "Lily" => 30, "Eddie" => 10 }

data structures: hash, array, hash

algorthim:
1. create an empty hash
2. select a name age pair from ages hash
3. if the age is less than 100
  1. add the pair to the new hash
4. repeat steps 2 and 3 until the end of the hash

=end

# young_ages = {}
# names = ages.keys
# counter = 0

# loop do
#   break if counter >= names.size

#   current_name = names[counter]
#   current_age = ages[current_name]

#   if current_age < 100
#     young_ages[current_name] = current_age
#   end

#   counter += 1
# end

# p young_ages

ages.reject! { |_, v| v > 100}

p ages
