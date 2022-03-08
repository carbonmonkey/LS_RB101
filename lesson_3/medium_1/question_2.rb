puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{40 + 2}"

# The String#+ method concatinates strings. The error is because an
# integer cannot be passed as an argument to String#+