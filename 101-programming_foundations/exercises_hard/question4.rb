# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections 
# like this 8-4-4-4-12 and represented as a string.
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# Write a method that returns one UUID when called with no parameters.
# (hexadecimal characters: 0-9 a:10 b:11 c:12 d:13 e:14 f:15)

def uuid_generator
  uuid = ""
  32.times do 
    num = rand(0..15)
    num_to_s = case num
               when (0..9)
                 num.to_s
               when 10
                 'a'
               when 11
                 'b'
               when 12
                 'c'
               when 13
                 'd'
               when 14
                 'e'
               when 15
                 'f'
               end
      uuid += num_to_s
  end
  uuid = uuid[0, 8] + "-" + uuid[8, 4] + "-" + uuid[12, 4] + "-" + uuid[16, 4] + "-" + uuid[20, 12]
end
# ==================== 

def generate_uuid
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end
  uuid
end
