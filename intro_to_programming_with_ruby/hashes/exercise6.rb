words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

hash = { }

words.each do |word|
  key = word.each_char.sort.join
  if hash.has_key?(key)
     hash[key].push(word)
  else
     hash[key] = [word]
  end
end

hash.each_value do |value|
  p value
end

