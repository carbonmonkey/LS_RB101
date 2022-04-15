=begin
Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

figure out the total age of just the male members of the family.

**problem**

- input is a hash of hashes
  - each sub-hash has two key-value pairs
    - age and gender
- output is an integer
  - the total of ages of the male munsters

**examples**

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
==> 444

**data structures**

- hash --> integer

**algorithm**

- initialize a total age variable and set it to 0

**loop start**
- starting with the first key in the hash, get its value  (returns a sub-hash)
- referenece the 'gender' key (returns 'male' or 'female' string)
- if the value is 'male'
  - reference the 'age' key (returns an integer)
  - add the integer to a total age variable
- repeat until the end of the input hash is reached
**loop end**

return the total age variable

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0

munsters.each_value do |hash|
  total_male_age += hash['age'] if hash['gender'] == 'male'
end

p total_male_age
