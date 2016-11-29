
def ask
  puts "please enter a number between 0 and 100:"
  number = gets.chomp.to_i
end 

def report_1(number)
  reportt = case 
    when number < 0
      "you can't enter a negative number!"
    when number <= 50 
      "#{number} is between 0 and 50."
    when number <= 100
      "#{number} is between 51 and 100."
    else
      "#{number} is above 100."
    end
  puts reportt
end

def report_2(number)
  reportt = case number
    when 0..50
      "#{number} is between 0 and 50."
    when 51..100
       "#{number} is between 51 and 100."
    else
      if number < 0
        "you can't enter a negative number!"
      else
        "#{number} is above 100."
      end
    end
    puts reportt
  end

report_1(ask)
report_2(ask)

