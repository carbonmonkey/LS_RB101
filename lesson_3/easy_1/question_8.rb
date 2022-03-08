 flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# array = []
# flintstones.each_with_index do |(k, v), i|
#   if i == 2
#     array.push(k, v)
#   end
# end
# p array

# f_array = []
# f_array.push(flintstones.key(2), flintstones['Barney'])
# p f_array

p flintstones.assoc('Barney')
