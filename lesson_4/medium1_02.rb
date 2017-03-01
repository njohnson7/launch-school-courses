# medium1_02.rb

# Alyssa created the following code to keep track of items for a shopping cart
# application she's writing:

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

# Alan looked at the code and spotted a mistake. "This will fail when
# update_quantity is called", he says.

# Can you spot the mistake and how to address it?


# The mistake is that the line in update_quantity actually has nothing to do
#  with the @quantity instance variable. Because there is only an attr_reader
#  method, it creates only a getter method for @quantity, but not a setter
#  method. So the line, quantity =, is actually initializing a local variable
#  named quantity and assigning it to update_count. Since it is a local variable,
#  it will only be accessible within the update_quantity method, and will have
#  no effect on the state of an InvoiceEntry instance. To remedy this, we could
#  prepend an @ symbol to quantity, or we could call attr_writer or attr_accessor
#  on quantity, or we could create our own setter method for quantity, quantity=.
#  If we decided to create a setter method, we would have to prepend self. to
#  quantity.