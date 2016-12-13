# Consider a character set consisting of letters, a space, and a point.
# Words consist of one or more, but at most 20 letters. An input text 
# consists of one or more words separated from each other by one or more
# spaces and terminated by 0 or more spaces followed by a point.

# Input should be read from, and including, the first letter of the first word
# up to and including the terminating point. The output text is to be produced
# such that successive words are separated by a single space with the last word
# being terminated by a single point. Odd words are copied in reverse order while
# even words are merely echoed. For example:

# 'whats the matter with kansas' becomes 'whats eht matter htiw kansas.'

def reverse_odd_words(string)
  odd_reverse = []
  string.scan(/\b\w+\b|\S/).each_with_index do |word, index|
    if index.odd?     
      odd_reverse << word.reverse
    else 
      odd_reverse << word
    end
  end
  if odd_reverse.last =~ /\W/
    last_word = odd_reverse.pop
  end
  odd_reverse.join(' ') + last_word.to_s
end

p reverse_odd_words("") == ""
p reverse_odd_words(".") == "."
p reverse_odd_words("hello") == "hello"
p reverse_odd_words("hello word.") == "hello drow."
p reverse_odd_words("hello word .") == "hello drow."
p reverse_odd_words("hello   word  .") == "hello drow." 
p reverse_odd_words("hello word  .") == "hello drow."
p reverse_odd_words("hello word world .") == "hello drow world."