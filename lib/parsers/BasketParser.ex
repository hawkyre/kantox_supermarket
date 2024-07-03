defmodule BasketParser do
  @spec parse_basket(String.t()) :: map()
  @doc """
  Parses a string of items into a map of item => count

  Expected format:
  "ITEM1,ITEM2,ITEM3"

  Returns a map of item => count
  """
  def parse_basket(basket) when is_binary(basket) do
    basket
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reduce(%{}, fn item, acc ->
      Map.put(acc, item, Map.get(acc, item, 0) + 1)
    end)
  end
end
