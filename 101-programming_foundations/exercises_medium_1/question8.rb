
# In another example we used some built-in string methods to change the case of a string. 
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize! 
# This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
# Write your own version of the rails titleize implementation.


def titleize(input)
  words = input.split(' ')
  words.map! do |word|
    word.capitalize
  end
  words.join(' ')
end


p titleize("you are a beautiful girl!") #=> "You Are A Beautiful Girl!"


#============= or =================


class String
  def titleize
    words = self.split(' ')
    words.map! do |word|
      word.capitalize
    end
    words.join(' ')
  end
end

a = "you are a beautiful girl!"
p a.titleize #=> "You Are A Beautiful Girl!"