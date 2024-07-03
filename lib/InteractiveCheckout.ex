defmodule InteractiveCheckout do
  @spec start() :: pid()
  def start do
    {:ok, pid} = GenServer.start_link(CheckoutGenServer, :ok)

    pid
  end

  @spec add_item(pid(), String.t()) :: :ok
  def add_item(pid, item) do
    GenServer.cast(pid, {:add_item, item})
  end

  @spec end_checkout(pid()) :: :ok
  def end_checkout(pid) do
    GenServer.cast(pid, :get_price)
  end
end
