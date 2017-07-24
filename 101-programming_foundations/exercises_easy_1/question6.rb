#way1
famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")
p famous_words

#way2
famous_words = "seven years ago..."
famous_words = famous_words.reverse + "Four score and ".reverse
p famous_words.reverse

#way3

famous_words = "seven years ago..."
famous_words.prepend( "Four score and ")
p famous_words
