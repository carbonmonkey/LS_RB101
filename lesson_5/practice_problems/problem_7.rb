=begin
Practice Problem 7

Given this code, what would be the final values of a and b?
Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

**problem**

1. a is assigned to 2
2. b is assigned to [5, 8]
3. arr is assigned to [a, b] ([2, [5, 8]])
4. arr[0] is reassigned to 4 (a is still 2)
5. arr is now [4, [5, 8]]
6. arr[1][0] -= a (arr[1][0] -= 2)
7. arr is now [4, [3, 8]]
8. b is now [3, 8] and a is still 2

arr[0] += 2 is element update. It doesn't change the value of the object
referenced by the local variable a

arr[1][0] -= a is element update also. It updates an element referenced by
both the collections arr and b, therefor mutating the collection objects 
themselves

=end

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a == 2
p b == [3, 8]
