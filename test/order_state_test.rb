require 'test_helper'
require 'minitest/autorun'
require_relative 'order.rb'

class OrderStateTest < Minitest::Test

  TALISKER = "Talisker"
  HIGHLAND_PARK = "Highland Park"

  def setup
    @warehouse = Warehouse.new
    @warehouse.add(TALISKER, 50)
    @warehouse.add(HIGHLAND_PARK, 25)
  end

  def test_order_is_filled_if_enough_in_warehouse
    order = Order.new(TALISKER, 50)
    order.fill(@warehouse)
    assert order.filled?
    assert_equal 0, @warehouse.get_inventory(TALISKER)
  end

  def test_order_unfilled_if_not_enough
    order = Order.new(TALISKER, 51)
    order.fill(@warehouse)
    refute order.filled?
    assert_equal 50, @warehouse.get_inventory(TALISKER)
  end
end