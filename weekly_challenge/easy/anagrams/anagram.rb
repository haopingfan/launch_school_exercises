class Anagram
  attr_reader :ori_word

  def initialize(ori_word)
    @ori_word = ori_word
  end

  def match(words)
    words.select do |word| 
      word.downcase != ori_word.downcase &&
      word.downcase.chars.sort == ori_word.downcase.chars.sort
    end
  end
end