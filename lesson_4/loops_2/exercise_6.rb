names = ['Sally', 'Joe', 'Lisa', "Henry"]

loop do
  break if names.empty?
  current_name = names.pop
  puts current_name
end
