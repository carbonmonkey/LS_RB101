def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id #1
  b_outer_id = b_outer.object_id #2
  c_outer_id = c_outer.object_id #3
  d_outer_id = d_outer.object_id #1

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id}(1) before calling the method."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id}(2) before calling the method."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id}(3) before calling the method."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id}(1) before calling the method."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id}(1) BEFORE and: #{a_outer.object_id}(1) AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id}(2) BEFORE and: #{b_outer.object_id}(2) AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id}(3) BEFORE and: #{c_outer.object_id}(3) AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id}(1) BEFORE and: #{d_outer.object_id}(1) AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id}(1) before the method and is: #{a_outer.object_id}(1) inside the method."
  puts "b_outer id was #{b_outer_id}(2) before the method and is: #{b_outer.object_id}(2) inside the method."
  puts "c_outer id was #{c_outer_id}(3) before the method and is: #{c_outer.object_id}(3) inside the method."
  puts "d_outer id was #{d_outer_id}(1) before the method and is: #{d_outer.object_id}(1) inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id}(1) before and: #{a_outer.object_id}(4) after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id}(2) before and: #{b_outer.object_id}(5) after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id}(3) before and: #{c_outer.object_id}(6) after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id}(1) before and: #{d_outer.object_id}(7) after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id #4
  b_inner_id = b_inner.object_id #5
  c_inner_id = c_inner.object_id #6
  d_inner_id = d_inner.object_id #7

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id}(4) inside the method (compared to #{a_outer.object_id}(4) for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id}(5) inside the method (compared to #{b_outer.object_id}(5) for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id}(6) inside the method (compared to #{c_outer.object_id}(6) for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id}(7) inside the method (compared to #{d_outer.object_id}(7) for outer)."
  puts
end

fun_with_ids