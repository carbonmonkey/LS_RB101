=begin 
Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
Modify the hash such that each member of the Munster family has an
additional "age_group" key that has one of three values describing 
the age group the family member is in (kid, adult, or senior). Your 
solution should produce the hash below:

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64
and a senior is aged 65+.

input: a hash with names as keys and sub-hashes as values
ouput: the hash with an additional key-value pair added to each sub-hash

- input hash names are string as keys
- input hash has values that are sub-hashes
- each sub-hash has two key-value pairs
  - age and gender
- add a third entry into each sub array
  - an age group
  - kid, senior or adult for the value of each
  - age 0-17 is kid, 18-64 is adult, 65 or more is senior

data structures: hash, array

algorithm:
1. set a counter to 0
2. create an array from the keys in the hash
3. loop through the hash
	4. access the value (sub-hash) of the first entry in the hash
		1. get a key from the keys hash using the counter
		2. use it to get the value(sub-hash) from the hash
	5. check the value associated with the age key
	6. depending on the value, add the appropriate key-value pair to the sub-hash:
		- 0-17 --> 'age_group' => 'kid'
		- 18-64 --> 'age_group' => 'adult'
		- 65+ --> 'age_group' => 'senior'
	7. increment the counter
	8. exit the loop when the end of the keys array is reached

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

counter = 0
keys = munsters.keys

# loop do
#   break if counter >= keys.size
#   current_munster = keys.fetch(counter)
#   current_munster_subhash = munsters[current_munster]
#   currents_munster_age = current_munster_subhash['age']

#   current_age_group = if (0..17).cover?(currents_munster_age)
#                         'kid'
#                       elsif (18..64).cover?(currents_munster_age)
#                         'adult'
#                       else
#                         'senior'
#                       end

#   current_munster_subhash['age_group'] = current_age_group

#   counter += 1
# end

def get_age_group(age)
  case age
  when (0..17)
    'kid'
  when (18..64)
    'adult'
  else
    'senior'
  end
end

def add_age_group!(hash)
  hash.each do |name, subhash|
    subhash['age_group'] = get_age_group(subhash['age'])
  end
end

add_age_group!(munsters)

p munsters
