require 'minitest/autorun'
require 'mocha/minitest'

require_relative '../src/order'

class OrderInteractionTest < Minitest::Test
  TALISKER = "Talisker"


  #TODO add in sequence
  # https://www.rubydoc.info/github/floehopper/mocha/Mocha/API#sequence-instance_method

  #   public void testFillingRemovesInventoryIfInStock() {
  #     //setup - data
  #     Order order = new Order(TALISKER, 50);
  #     Mock warehouseMock = new Mock(Warehouse.class);
  #
  #     //setup - expectations
  #     warehouseMock.expects(once()).method("hasInventory")
  #       .with(eq(TALISKER),eq(50))
  #       .will(returnValue(true));
  #     warehouseMock.expects(once()).method("remove")
  #       .with(eq(TALISKER), eq(50))
  #       .after("hasInventory");
  #
  #     //exercise
  #     order.fill((Warehouse) warehouseMock.proxy());
  #
  #     //verify
  #     warehouseMock.verify();
  #     assertTrue(order.isFilled());
  #   }
  def test_filling_removes_inventory_if_in_stock
    order = Order.new(TALISKER, 50)
    warehouse_mock = mock('warehouse')

    warehouse_mock.expects(:has_inventory?).with(TALISKER, 50).returns(true)
    warehouse_mock.expects(:remove).with(TALISKER, 50)

    order.fill(warehouse_mock)
    assert order.filled?
  end

  #
  #   public void testFillingDoesNotRemoveIfNotEnoughInStock() {
  #     Order order = new Order(TALISKER, 51);
  #     Mock warehouse = mock(Warehouse.class);
  #
  #     warehouse.expects(once()).method("hasInventory")
  #       .withAnyArguments()
  #       .will(returnValue(false));
  #
  #     order.fill((Warehouse) warehouse.proxy());
  #
  #     assertFalse(order.isFilled());
  #   }


end