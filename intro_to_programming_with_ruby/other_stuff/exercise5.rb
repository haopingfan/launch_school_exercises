def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }


=begin
 
 block miss &
 block is an argument, &block is an proc 

=end