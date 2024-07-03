defmodule Storage.Inventory do
  @items %{
    "GR1" => %{price: 311_000_000, name: "Green tea"},
    "SR1" => %{price: 500_000_000, name: "Strawberries"},
    "SR1_discount" => %{price: 450_000_000},
    "CF1" => %{price: 1_123_000_000, name: "Coffee"}
  }

  # 8 decimal precision integer representation for accuracy (overkill for this use case but it's how currency is handled)
  def items, do: @items

  @spec get_price(String.t()) :: number()
  @doc """
  Gives the price of an item

  Expects an item id

  Returns an 8 decimal precision integer with the corresponding price
  """
  def get_price(item_id) do
    Map.get(items(), item_id).price
  end

  @spec get_name(String.t()) :: String.t()
  @doc """
  Gives the name of an item

  Expects an item id

  Returns a string with the corresponding name
  """
  def get_name(item_id) do
    Map.get(items(), item_id).name
  end
end
