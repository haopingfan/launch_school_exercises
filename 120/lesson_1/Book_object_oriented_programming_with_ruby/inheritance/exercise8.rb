=begin

Given the following code...

bob = Person.new
bob.hi

And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?

=end

what's the problem:
the hi method is private, the object of Person class can't access it. 

how to fix it:
1.
moving hi method above the reserved word "Private"

2.
create a public instance method in Person class to access it.