family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }


immediate_family = family.select do |key,value|
  key == :sisters || key == :brothers
end

arr = immediate_family.values.flatten
p arr