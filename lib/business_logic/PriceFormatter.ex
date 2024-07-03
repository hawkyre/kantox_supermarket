defmodule PriceFormatter do
  @spec format_price(number()) :: String.t()
  @doc """
  Formats a price to a string with 2 decimal precision

  Expects an 8 decimal precision integer

  Returns a string with the price formatted to 2 decimal precision
  """
  def format_price(price) do
    decimal_price = get_decimal_price(price)
    "$#{decimal_price}"
  end

  defp get_decimal_price(price) do
    (round(price / 10 ** 6) / 100)
    |> :erlang.float_to_binary(decimals: 2)
  end
end
