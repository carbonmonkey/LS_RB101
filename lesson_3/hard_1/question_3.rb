# A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# => one is: one
# => two is: two
# => three is: three

# The 'mess_with_vars' method is passed as aguments the variables initialized
# in the top level. The values are assigned to the method parameters and made 
# available to the method as local variables. The varaibles scoped at
# the method level are reassigned to eachothers values. This does not affect
# the variables in the outer-scope. 

# B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# => one is: one
# => two is: two
# => three is: three

# Same as exapmle A, excepts this time the local varaibles scoped inside
# the method are reassigned to new string objects. Again, this has no
# effect on the varaibles in the outer-scope.

# C
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# => one is: two
# => two is: three
# => three is: one

# Almost the same as example A, but this time the the destructive method
# 'gsub!' is called on each variable within the 'mess_with_vars' method.
# Although method definitions have self-contained scope with respect to
# local variables, 'mess_with_vars' local variables are pointed to the
# same objects as the top-level variables. The 'gsub!' method modifies
# the values of those objects in places. When the top-level variables
# are finally output, those modified values are displayed.

