class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Alan noticed that this will fail when update_quantity is called. Since quantity is an instance variable, 
# it must be accessed with the @quantity notation when setting it. One way to fix this is to change 
# attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?


# Nothing incorrect syntactically. However, you are altering the public interfaces of the class. 
# In other words, you are now allowing clients of the class to change the quantity directly 
# (calling the accessor with the instance.quantity = <new value> notation) rather than by going through 
# the update_quantity method. It means that the protections built into the update_quantity method can be
# circumvented and potentially pose problems down the line.