def url?(input)
  input.match(/^https?:\/\/\S+$/) ? true : false
end

p url?('http://launchschool.com') 
p url?('https://example.com') 
p url?('https://example.com hello')
p url?('   https://example.com')