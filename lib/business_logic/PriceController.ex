defmodule PriceController do
  @coffee_discount 2 / 3

  @spec get_price_of_basket(map()) :: number()
  @doc """
  Returns the price of a basket of items

  Expects a map of the format %{item => quantity}

  Returns an 8 decimal precision integer with the corresponding price
  """
  def get_price_of_basket(basket) when is_map(basket) do
    basket
    |> Enum.reduce(0, fn basket_item, acc -> acc + get_price(basket_item) end)
  end

  @spec get_price({String.t(), number()}) :: number()
  @doc """
  Returns the price for a given quantity of a certain item

  Expects a tuple of the format {item, quantity}

  Returns an 8 decimal precision integer with the corresponding price
  """
  def get_price({"GR1", quantity}) when rem(quantity, 2) == 0 do
    price = Storage.Inventory.get_price("GR1")

    price * quantity / 2
  end

  def get_price({"GR1", quantity}) when rem(quantity, 2) == 1 do
    price = Storage.Inventory.get_price("GR1")

    price * (quantity - 1) / 2 + price
  end

  def get_price({"SR1", quantity}) when quantity >= 3 do
    price = Storage.Inventory.get_price("SR1_discount")

    price * quantity
  end

  def get_price({"CF1", quantity}) when quantity >= 3 do
    price = Storage.Inventory.get_price("CF1") * @coffee_discount

    price * quantity
  end

  def get_price({item, quantity}) do
    Storage.Inventory.get_price(item) * quantity
  end
end
