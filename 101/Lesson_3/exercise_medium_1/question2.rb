# Create a hash that expresses the frequency with which each letter occurs in this string:
# statement = "The Flintstones Rock"
# ex: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"

result = {}

statement.each_char do |character|
  result[character] ||= 0  
  result[character] += 1
end

result.delete(" ")
p result 



# ======= or ==========


statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result



