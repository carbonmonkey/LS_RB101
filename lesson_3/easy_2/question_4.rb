advice = "Few things in life are as important as house training your pet dinosaur."
# p advice =~ /life/
# p advice.match?("life")
# p advice =~ /Dino/
# p advice.match(/Dino/i)
# p advice.include?('Dino')
# p advice.delete('^Dino')
# p advice
p advice.split.include?('Dino')
p advice.split.include?('dino')
