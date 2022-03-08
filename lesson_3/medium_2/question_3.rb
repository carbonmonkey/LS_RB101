def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# My string looks like this now: pumpkins
# My array looks like this now: [pumpkins, rutabaga]

# '+=' is reassignment. It reassignes the variable 'a_string_param' to
# a new String object, and has no effect on the varaible 'my_string'. They 
# are separate variables, even thought they originally pointed to the same object.

# '<< is a destructive method. It mutates the object that both 'my_array'
# and 'an_array_param' are bound to, by adding an additional element to
# the Array object. This change is apparent when 'my_array'
# is refernced on line 11.