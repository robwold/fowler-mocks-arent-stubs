class Order
  def initialize(brand, quantity)
    @brand = brand
    @quantity = quantity
    @filled = false
  end

  def fill(warehouse)
    if warehouse.has_inventory?(@brand, @quantity)
      warehouse.remove(@brand, @quantity)
      @filled = true
    end
  end

  def filled?
    @filled
  end
end