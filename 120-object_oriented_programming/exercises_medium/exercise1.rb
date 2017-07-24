class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ 
# before balance when you refer to the balance instance variable in the body of the positive_balance? 
# method."

# Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"
# Who is right, Ben or Alyssa, and why?

# Ans: Ben is right, due to attr_reader method, we can get instance variable @balance without @.
#      Since the attr_reader automatically create a getter method for us.
#      (Ruby create a instance method called balance return @balance for us)