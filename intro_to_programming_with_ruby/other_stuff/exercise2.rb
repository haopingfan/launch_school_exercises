def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

=begin
Nothing is printed to the screen because the block is 
never activated with the .call method. 

The method returns a Proc object(block is a Proc object).
=end



def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

=begin
Hello from inside the execute method! will be printed 
to screen. and it returns nil(since puts method returns nil.
=end