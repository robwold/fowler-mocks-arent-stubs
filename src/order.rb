class Order
  def initialize(brand, quantity)
    @brand = brand
    @quantity = quantity
  end

  # Get failing mocha assertions:
  # Minitest::Assertion: unexpected invocation: #<Mock:warehouse>.verify()
  # unsatisfied expectations:
  # - expected exactly once, not yet invoked: #<Mock:warehouse>.remove("Talisker", 50)
  # - expected exactly once, not yet invoked: #<Mock:warehouse>.has_inventory?("Talisker", 50)
  def fill(warehouse)
    warehouse.has_inventory?(@brand, @quantity)
    # yes this is broken
    warehouse.remove(@brand, @quantity)
  end

  def filled?
    true
  end
end