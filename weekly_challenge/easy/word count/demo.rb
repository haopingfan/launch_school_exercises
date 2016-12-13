class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = {}
    phrase.scan(/\b[\w']+\b/).each do |word|
      word = word.downcase
      words[word] ||= 0
      words[word] += 1
    end
    words
  end

end