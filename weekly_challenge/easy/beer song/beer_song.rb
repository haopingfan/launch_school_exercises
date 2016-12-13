class BeerSong

  def verses(num1, num2)
    lyric = ''
    num1.downto(num2).each_with_index do |num, index|
      lyric << "\n" unless (index == 0) 
      if num == 0 
        lyric << ("No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n")
      elsif num == 2
        lyric << ("2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n")
      elsif num == 1
        lyric << ("1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n")
      else
       lyric << ("#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
        "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n")
      end
    end
    lyric
  end

  def verse(num)
    verses(num, num)
  end

  def lyrics
    verses(99, 0)
  end
  
end