def cdtz(num)
  puts num
  cdtz(num-1) if num >= 1
end

cdtz(5)
