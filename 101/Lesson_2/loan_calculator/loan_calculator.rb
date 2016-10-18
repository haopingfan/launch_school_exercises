def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to the loan calculator!")
prompt("-------------------------------")

loop do # main loop to perform another calculation
  # ask user to input
  loan_amount = nil
  loop do
    prompt("Please enter the loan amount:")
    loan_amount = gets.chomp.delete '$'
    if loan_amount.to_f > 0
      break
    else
      prompt("Hmm... Must be positive number.")
    end
  end

  apr = nil
  loop do
    prompt_apr = <<-MSG
Please enter the Annual Percentage Rate:
   (Example: input 5 for 5%)
MSG
    prompt(prompt_apr)
    apr = gets.chomp.delete '%'
    if apr.to_f > 0
      break
    else
      prompt("Hmm... Must be positive number.")
    end
  end

  duration_year = nil
  loop do
    prompt("Please enter the loan duration: (in years)")
    duration_year = gets.chomp
    if duration_year.to_i > 0
      break
    else
      prompt("Hmm... Must be positive integer.")
    end
  end

  # unit conversion

  p = loan_amount.to_f
  j = apr.to_f / 100 / 12
  n = duration_year.to_i * 12

  # formula

  m = p * (j / (1 - (1 + j)**-n))
  m = m.round(2)

  # m = monthly payment
  # p = loan amount
  # j = monthly interest rate
  # n = loan duration in months

  # show result

  result = <<-MSG
With loan amount: $#{loan_amount}, APR: #{apr}%, loan duration: #{duration_year} years,
The monthly payment will be: $#{m}

MSG

  prompt(result)

  # main loop to calculate again

  another_calculation = <<-MSG
Would you like to perform another calculation?
   (Y to calculate, others to leave)
MSG

  prompt(another_calculation)
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for using the loan calculation, Goodbye!")
