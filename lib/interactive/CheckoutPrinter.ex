defmodule CheckoutPrinter do
  alias Rendering.BoxRenderer

  @spec print_total(number()) :: {:ok}
  def print_total(price) do
    price_string = price |> PriceFormatter.format_price()
    BoxRenderer.draw_box(["Total:", price_string])
  end

  @spec print_ticket(map()) :: {:ok}
  def print_ticket(items) do
    item_list = items |> Enum.map(&format_item/1)
    price = PriceController.get_price_of_basket(items) |> PriceFormatter.format_price()

    BoxRenderer.draw_box([
      ["Welcome to the Kantox Supermarket!"],
      ["Here's your ticket:"],
      item_list,
      ["Total: #{price}"]
    ])
  end

  defp format_item({item, quantity}) do
    quantity_string = quantity |> Integer.to_string()
    item_name = item |> Storage.Inventory.get_name()
    price_string = PriceController.get_price({item, quantity}) |> PriceFormatter.format_price()

    ["• #{item_name} (#{quantity_string})", price_string]
  end
end
