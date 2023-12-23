def greetings(arr, hsh)
  print "Hello, #{arr.join(" ")}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end


greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."