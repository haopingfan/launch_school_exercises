def prompt(message)
  puts "=> #{message}"
end

def validation(input, type)
  if type == 'float'
    input.to_f > 0
  elsif type == 'integer'
    input.to_i > 0 && input.match(/^\d+$/)
  end
end

def validation_loop(prompt1, type = 'float')
  input = nil
  loop do
    prompt(prompt1)
    input = gets.chomp
    input = input.delete '$' if prompt1.include?("loan amount")
    input = input.delete '%' if prompt1.include?("Annual Percentage Rate")
    if validation(input, type)
      break
    else
      prompt("Hmm... Must be positive number.") if type == 'float'
      prompt("Hmm... Must be positive integer.") if type == 'integer'
    end
  end
  input
end

# program starts

prompt("Welcome to the loan calculator!")
prompt("-------------------------------")

loop do # main loop to perform another calculation
  # ask user for input
  loan_amount = validation_loop("Please enter the loan amount:")

  prompt_annual_rate = <<-MSG
Please enter the Annual Percentage Rate:
   (Example: input 5 for 5%)
MSG
  annual_rate = validation_loop(prompt_annual_rate)

  years = validation_loop("Please enter the loan duration: (in years)", 'integer')

  # unit conversion

  monthly_rate = annual_rate.to_f / 100 / 12
  months = years.to_i * 12

  # formula

  monthly_payment = loan_amount.to_f * (monthly_rate / (1 - (1 + monthly_rate)**-months))
  monthly_payment = monthly_payment.round(2)

  # show result

  result = <<-MSG
With loan amount: $#{loan_amount}, APR: #{annual_rate}%, loan duration: #{years} years,
The monthly payment will be: $#{monthly_payment}

MSG

  prompt(result)

  # main loop to ask if perform another calculation

  another_calculation = <<-MSG
Would you like to perform another calculation?
   (enter Yes to calculation, No to leave)
MSG
  prompt(another_calculation)
  answer = nil
  loop do
    answer = gets.chomp
    if answer.casecmp('yes').zero? || answer.casecmp('no').zero?
      break
    else
      prompt("Not valid, plz enter Yes to calculation, No to leave.")
    end
  end
  break if answer == 'no'
end

prompt("Thanks for using the loan calculation, Goodbye!")
