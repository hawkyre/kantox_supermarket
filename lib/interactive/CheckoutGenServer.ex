defmodule CheckoutGenServer do
  use GenServer

  @impl true
  def init(_) do
    {:ok, %{items: %{}}}
  end

  @impl true
  def handle_cast(:get_price, %{items: items} = state) do
    CheckoutPrinter.print_ticket(items)
    {:noreply, state}
  end

  @impl true
  def handle_cast({:add_item, new_item}, %{items: items} = state) do
    items =
      cond do
        Map.has_key?(items, new_item) -> Map.update!(items, new_item, &(&1 + 1))
        true -> Map.put(items, new_item, 1)
      end

    new_price = PriceController.get_price_of_basket(items)
    CheckoutPrinter.print_total(new_price)

    {:noreply, %{state | items: items}}
  end
end
