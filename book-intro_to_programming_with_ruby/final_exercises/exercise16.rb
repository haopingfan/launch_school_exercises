a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a.map! do |two_word|
  two_word.split
end

a.flatten!

p a