defmodule RenderingUtilsTest do
  use ExUnit.Case

  test "should format integer-like 8-decimal-precision numbers with 2 decimal places" do
    assert PriceFormatter.format_price(2 * 10 ** 8) == "$2.00"
  end

  test "should format 2-decimals float-like 8-decimal-precision numbers with 2 decimal places" do
    assert PriceFormatter.format_price(12.34 * 10 ** 8) == "$12.34"
  end

  test "should format 1-decimal float-like 8-decimal-precision numbers with 2 decimals" do
    assert PriceFormatter.format_price(10.1 * 10 ** 8) == "$10.10"
  end
end
