defmodule KantoxSupermarket do
  @spec checkout(String.t()) :: String.t()
  @doc ~S"""
    Returns the price of a basket of items.

    Expects a string of items in the format "ITEM1,ITEM2,ITEM3"

    ## Examples

        iex> KantoxSupermarket.checkout("GR1,SR1,CF1")
        "$19.34"

  """
  def checkout(basket) do
    basket
    |> BasketParser.parse_basket()
    |> PriceController.get_price_of_basket()
    |> PriceFormatter.format_price()
  end
end
