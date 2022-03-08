# what is != and where should you use it?
# The 'not eqaul to' comparison operator. Can be used in conditionals

# put ! before something, like !user_name
# Returns false when placed before something that is truthy, or true
# when placed before false or nil.


# put ! after something, like words.uniq!
# By convention it's used to denote a method that mutates an the caller.
# It doen't, however, cause mutation itself.

# put ? before something
# When placed before a single character, it returns a string of that 
# character. Used in a ternary operator before to separate the condition
# from the expression to execute if true

# put ? after something
# By convention it's used to denote a method that returns a boolean
# value.

# put !! before something, like !!user_name
# returns true if placed before something truthy, or false if placed
# before false or nil