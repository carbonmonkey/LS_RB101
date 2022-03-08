ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key?('Spot')
p ages.member?('Spot')
p ages.has_key?('Spot')
p !!ages['Spot']
p ages.include?('Spot')
p ages.fetch('Spot', false)
