# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

=begin

input: an array of names
output: the index of the first name that starts with "Be"

- names are strings

expected output: 3

data structure: array

algorithm:
- set a counter to 0
- set index as none
- loop through the names
  - get a name from the array
  - set it as current name
  - if the name begins with "Be"
    - save the value of counter as index
    - exit the loop
  - repeat the loop until the end of the array is reached
- referenece the value of index

=end

# counter = 0
# index = 'none'

# loop do
# break if counter >= flintstones.size

# current_name = flintstones[counter]
# if current_name.slice(0, 2) == "Be"
#   index = counter
#   break
# end

# counter += 1
# end

# p index

# index_num = 'none'
# flintstones.each_with_index do |name, index|
#   if index_num == 'none' && name[0..1] == "Be"
#     index_num = index
#   end
# end

# p index_num

index = 'none'
flintstones.each do |name|
  if name.start_with?('Be') && index == 'none'
    index = flintstones.index(name)
  end
end

p index
