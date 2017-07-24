# Alyssa created the following code to keep track of items for a shopping cart application she's writing:
=begin
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
=end

# Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says.
# Can you spot the mistake and how to address it?

# the problem is that the quantity in update_quantity can't access to @quantity,
# it's just a local variable initialization.
# first we need to change attr_reader to attr_accessor.
# second we need to prefix self before quantity. 

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

# ------- or --------

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0
  end