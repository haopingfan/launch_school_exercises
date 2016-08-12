def squares(number)
  number*number
end

array = [1.23,5.22,12.45]

array.each {|x| puts squares(x)}