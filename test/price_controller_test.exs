defmodule PriceControllerTest do
  use ExUnit.Case

  test "should price buy-1-get-1-free green tea correctly" do
    assert PriceController.get_price({"GR1", 1}) == Storage.Inventory.get_price("GR1")
    assert PriceController.get_price({"GR1", 2}) == Storage.Inventory.get_price("GR1")
    assert PriceController.get_price({"GR1", 3}) == Storage.Inventory.get_price("GR1") * 2
  end

  test "should price discounted strawberries correctly" do
    assert PriceController.get_price({"SR1", 2}) == Storage.Inventory.get_price("SR1") * 2

    assert PriceController.get_price({"SR1", 3}) ==
             Storage.Inventory.get_price("SR1_discount") * 3
  end

  test "should price 3x2 coffee correctly" do
    assert PriceController.get_price({"CF1", 2}) == Storage.Inventory.get_price("CF1") * 2
    assert PriceController.get_price({"CF1", 3}) == Storage.Inventory.get_price("CF1") * 3 * 2 / 3
  end
end
