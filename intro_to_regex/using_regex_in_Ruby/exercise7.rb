def format_date(date)
  date.gsub(/^(\d\d\d\d)([\-\/])(\d\d)\2(\d\d)$/,'\4.\3.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)