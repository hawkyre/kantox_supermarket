defmodule BoxRendererTest do
  alias Rendering.BoxRenderer
  use ExUnit.Case

  test "should create an empty 2x4 box with 1 unit of padding" do
    buffer = BoxRenderer.create_box_buffer([])

    assert buffer |> length() == 2
    assert Enum.all?(buffer, fn item -> item |> String.length() == 4 end)
  end

  test "should create a 5x10 box when there is one item of length 6 (2 + 6 + 2)" do
    buffer = BoxRenderer.create_box_buffer(["length"])

    assert buffer |> length() == 5
    assert Enum.all?(buffer, fn item -> item |> String.length() == 10 end)
  end

  test "should create a (4+2n-1)x(4+max(n)) box when inputting a list of n strings" do
    items = ["item1", "item 2", "lengthof10"]

    box_width = 4 + String.length("lengthof10")

    buffer = BoxRenderer.create_box_buffer(items)

    assert buffer |> length() == 4 + 2 * length(items) - 1
    assert Enum.all?(buffer, fn item -> item |> String.length() == box_width end)
  end

  test "should create a (4+n)x(4+max(n)) box when inputting a list of 1 list of n strings" do
    items = [["item -1", "item 2", "very long item"]]

    box_width = 4 + String.length("very long item")

    buffer = BoxRenderer.create_box_buffer(items)

    assert buffer |> length() == 4 + (items |> Enum.at(0) |> length())
    assert Enum.all?(buffer, fn item -> item |> String.length() == box_width end)
  end

  test "should create a correctly-sized box when inputting a split item" do
    items = [["item 1", ["left", "right"]]]

    box_width = 4 + String.length("left") + 1 + String.length("right")

    buffer = BoxRenderer.create_box_buffer(items)

    assert buffer |> length() == 4 + (items |> Enum.at(0) |> length())
    assert Enum.all?(buffer, fn item -> item |> String.length() == box_width end)
  end
end
