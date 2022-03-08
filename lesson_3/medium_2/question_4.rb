def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# => My string looks like this now: pumpkinsrutabaga
# => My array looks like this now: ["pumpkins"]

# The results are opposite of the last problem.
# The String object that both 'my_string' and 'a_string param' point to
# is mutated. 'an_array_param' is reassigned to a new Array object, and
# 'my_array' is left unchanged.