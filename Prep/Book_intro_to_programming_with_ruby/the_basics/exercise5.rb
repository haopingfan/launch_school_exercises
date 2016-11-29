def factorial(number)
  a = 1
  i = number.to_i
  
  while i > 0
    a = a*i
    i -= 1
  end

  return a 
end

array = [5,6,7,8]

array.each {|x| puts factorial(x) }