advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!("Few things in life are as important as ")
p advice

advice = "Few things in life are as important as house training your pet dinosaur."
p advice["Few things in life are as important as "]
p advice

# String#slice is an alias for String#[]. It doesn't mutate the original string.