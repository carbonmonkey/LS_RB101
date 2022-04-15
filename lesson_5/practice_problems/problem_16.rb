=begin
Practice Problem 16

Write a method that returns one UUID when called with no parameters.

**problem**

- no input
- output is a UUID
  - 32 hexadecimal characters
  - 5 sections
    - 8-4-4-4-12
- hexadecimal is 16 base
  - 0-9 a-f

**examples**

make_uuid == "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

**data structures**

- array --> string

**algorithm**

- create an empty string for the result
- create an array of strings with the numbers 0-9 and letters a-f
  **loop**
  - get a random value from the array
  - add it to the result string
  - repeat until the string is 32 characters long
  **end loop**
- insert a dash into the result string at indexes 8, 13, 18 and 23
- return the string
=end

CHARS = ('0'..'9').to_a + ('a'..'f').to_a

# def make_uuid
#   uuid = ''
#   36.times do |i|
#     if i == 8 || i == 13 || i == 18 || i == 23
#       uuid << '-'
#     else
#       uuid << CHARS.sample
#     end
#   end
#   uuid
# end

# def make_uuid
#   uuid = ''
#   sections = [8, 4, 4, 4, 12]
#   sections.each do |section|
#     section.times { uuid += CHARS.sample }
#     uuid += '-' unless section == sections.last
#   end
#   uuid
# end

def make_uuid
  template = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
  template.chars.map do |char|
    char == 'x' ? CHARS.sample : char
  end.join
end

p make_uuid
