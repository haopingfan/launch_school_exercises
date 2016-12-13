class Scrabble
  one = ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].zip([1]*10)
  two = ['D', 'G'].zip([2]*2)
  three = ['B', 'C', 'M', 'P'].zip([3]*4)
  four = ['F', 'H', 'V', 'W', 'Y'].zip([4]*5)
  five = [['K', 5]]
  eight = ['J', 'X'].zip([8]*2)
  ten = ['Q', 'Z'].zip([10]*2)
  combine = one + two + three + four + five + eight +ten
  LETTER_VALUE = Hash[combine]
  LETTER_VALUE.default= 0 

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word == '' || word == nil 
    word.upcase.chars.map{ |char| LETTER_VALUE[char] }.inject(:+)
  end

  def self.score(word)
    return 0 if word == '' || word == nil 
    word.upcase.chars.map{ |char| LETTER_VALUE[char] }.inject(:+)
  end
end