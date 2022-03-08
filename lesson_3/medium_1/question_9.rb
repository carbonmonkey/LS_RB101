def foo(param = "no") # always returns 'yes'
  "yes"
end

def bar(param = "no") # returns 'yes' if param is assigned to 'no'. 
  param == "no" ? "yes" : "no" # otherwise returns 'no'.
end

p bar(foo)

# => "no"
# the returned value of 'foo' is "yes", and is passed as an argument
# to 'bar', which returns "no" 