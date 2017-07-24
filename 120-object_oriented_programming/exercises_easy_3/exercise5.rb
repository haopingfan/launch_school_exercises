class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer #=> NoMethod Error
tv.model #=> invoke the instance method model

Television.manufacturer #=> invoke the class method manufacturer
Television.model #=> NoMethod Error

