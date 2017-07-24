class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# -------------------------------------------------

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# Ans: there is no difference in show_template methods.
#      they both call getter method to get instance variable.
#      But there is difference in create_template methods.
#      The above one set instance variable directly.
#      The below one call setter method to set instance variable.

# Due to Ruby general style, don't use self when it's not required
# Don't use self in getter method.