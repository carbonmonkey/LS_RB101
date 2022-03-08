if false
  greeting = "hello world"
end

p greeting


# REVISED! If a local varaiable is initialized within an if statement, and the
# expression in which it is initialized is not executed, the local variable
# is initialized to nil

# An exception is raised because the variable 'greeting' is never initialized
# or defined. The if condition on line 1 always evaluates to false, so
# line 2 is never executed.