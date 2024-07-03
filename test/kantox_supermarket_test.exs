defmodule KantoxSupermarketTest do
  use ExUnit.Case
  doctest KantoxSupermarket

  test "should discount green tea when quantity is odd" do
    basket = "GR1,SR1,GR1,GR1,CF1"
    assert KantoxSupermarket.checkout(basket) == "$22.45"
  end

  test "should discount green tea when quantity is even" do
    basket = "GR1,GR1"
    assert KantoxSupermarket.checkout(basket) == "$3.11"
  end

  test "should discount bulk orders of strawberries" do
    basket = "SR1,SR1,GR1,SR1"
    assert KantoxSupermarket.checkout(basket) == "$16.61"
  end

  test "should discount bulk orders of coffee" do
    basket = "GR1,CF1,SR1,CF1,CF1"
    assert KantoxSupermarket.checkout(basket) == "$30.57"
  end
end
