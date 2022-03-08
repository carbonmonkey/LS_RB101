greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings          #  => {:a=>"hi there"}

# Both informal_greeting and greetings[:a] reference the same String
# object. Line 3 mutates the value of that object.