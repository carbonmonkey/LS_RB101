=begin

input: an array of names
output: a hash with names as keys and positions in the array are values

- array elements are strings
- positions are integers

example:
input: 
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

expected output:
{ 
  'Fred'    => 1,
  'Barney'  => 2,
  'Wilma'   => 3,
  'Betty'   => 4,
  'Pebbles' => 5,
  'BamBam'  => 6
}

data structures: array, hash

algorthim:
1. create an empty hash
2. get the first name in the array
3. set it as the current name
4. get the index number for the first name
5. set it as the current position
6. add the current name and current value as a key-value pair to the hash
7. repeat steps 2-6 until the end of the array is reached

=end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
stones_hash = {}

# counter = 0
# loop do
#   break if counter >= flintstones.size

#   current_name = flintstones.fetch(counter)
#   current_position = counter

#   stones_hash[current_name] = current_position

#   counter += 1
# end

flintstones.each_with_index do |name, index|
  stones_hash[name] = index
end

# p flintstones.each_with_object({}) { |name, hash| hash[name] = flintstones.index(name) }

p stones_hash
