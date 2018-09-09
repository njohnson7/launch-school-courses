# medium1_03.rb

# In the last question Alyssa showed Alan this code which keeps track of items
# for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  protected

  def quantity=(num)
    @quantity = num
  end
end

invoice = InvoiceEntry.new('tacos', 42)
p invoice.quantity
# p invoice.quantity = 5
p invoice.update_quantity(10)
p invoice.quantity

# Alan noticed that this will fail when update_quantity is called. Since
# quantity is an instance variable, it must be accessed with the @quantity
# notation when setting it. One way to fix this is to change attr_reader to
# attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?


# Fixing it this way would allow the quantity setter method to be called outside
#  the class definition as well, since attr_accessor creates a public setter
#  method, so @quantity would be able to be modified directly from an instance
#  of InvoiceEntry. One way to avoid this would be to not use attr_accessor,
#  but instead to create a protected setter method, so that way it could only
#  be called from within the class definition, and not from outside of it.
