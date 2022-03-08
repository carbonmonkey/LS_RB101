numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
# delete_at removes and returns the value at index 1, which mutates the array
# [1, 3, 4, 5]

numbers.delete(1)
# delete removes any values that match the argument, returns the value, mutates the
# array [2, 3, 4, 5]