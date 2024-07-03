# KantoxSupermarket

This is a simple checkout system for the Kantox Supermarket.

## Usage (Traditional checkout)

To start the traditional checkout, run:

```elixir
iex> KantoxSupermarket.checkout("GR1,SR1,CF1")
```

## Usage (Interactive checkout)

To start the interactive checkout, run:

```elixir
iex> InteractiveCheckout.start()
```

Then, you can add items to the basket and see the ticket price in real time:

```elixir
iex> InteractiveCheckout.add_item("GR1")
```

You can also end the checkout to see the final ticket price:

```elixir
iex> InteractiveCheckout.end_checkout()
```

## Testing

To run the tests, run:

```elixir
mix test
```

or, if you want to see the coverage:

```elixir
mix test --cover
```
