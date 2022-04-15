=begin
Practice Problem 6

One of the most frequently used real-world string properties
is that of "string substitution", where we take a hard-coded
string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name,
age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
...like this:

(Name) is a (age)-year-old (male or female).

**problem**

- input is a hash of hashes
- ouput is a printed string
  - information from hash interpolated into the string
  - the name is a key from the main hash
  - the age and gender are values from each sub-hash

**examples**

output --> "Herman is a 32-year-old male."
...

**data structures**

original hash

**algorithm**

**loop**
  - get a key(name) from the hash
  - get the associated value (sub-hash)
  - use the 'age' key the get the integer value of the age
  - use the 'gender' key the get the string value of the gender
  - interpolate the three values into a string for output
  - print the string
  - repeat until the end of the hash is reached
**end loop**
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts %(#{name} is a #{details['age']}-year-old #{details['gender']}.)
end
