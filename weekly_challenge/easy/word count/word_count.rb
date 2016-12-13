class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase.gsub(/[^a-zA-Z0-9']|\B'\b|\b'\B/, ' ')
  end

  def word_count
    words = {}
    phrase.split.each do |word|
      word = word.downcase
      words[word] ||= 0 
      words[word] += 1
    end
    words
  end
end