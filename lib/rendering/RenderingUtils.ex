defmodule Rendering.RenderingUtils do
  @spec insert_white_lines(list()) :: list()
  @doc ~S"""
  Inserts empty string arrays at the beginning, end and between items / &Rendering.RenderingUtils.insert_white_lines/1

  Expects:
  - A list of elements
  - An accumulator

  Returns a list of elements

  ## Examples

      iex> Rendering.RenderingUtils.insert_white_lines(["a", "b", "c"])
      [[""], ["a"], [""], ["b"], [""], ["c"], [""]]
  """
  def insert_white_lines(elements), do: insert_white_lines_recursive(elements, [])

  defp insert_white_lines_recursive([], acc) do
    Enum.reverse(acc)
  end

  defp insert_white_lines_recursive([element], acc) do
    insert_white_lines_recursive([], [[""], element, [""] | acc])
  end

  defp insert_white_lines_recursive([element | rest_of_elements], acc) do
    insert_white_lines_recursive(rest_of_elements, [element, [""] | acc])
  end

  @spec flatten_into_array_of_items(list()) :: list()
  @doc ~S"""
  Flattens a list of lists once. If the array is a list of strings, returns it as is.

  Expects a list of lists

  Returns an array of items

  ## Examples

      iex> Rendering.RenderingUtils.flatten_into_array_of_items([["a"], ["b", ["c_left", "c_right"]]])
      ["a", "b", ["c_left", "c_right"]]
  """
  def flatten_into_array_of_items(elements),
    do: flatten_into_array_of_items_recursive(elements, [])

  defp flatten_into_array_of_items_recursive([], []), do: []
  defp flatten_into_array_of_items_recursive([], acc), do: acc |> Enum.reverse()

  defp flatten_into_array_of_items_recursive([element | rest], acc) when is_list(element),
    do: flatten_into_array_of_items_recursive(rest, Enum.reverse(element) ++ acc)

  defp flatten_into_array_of_items_recursive([element | rest], acc),
    do: flatten_into_array_of_items_recursive(rest, [element | acc])

  @spec get_length_of_item(String.t() | [String.t() | String.t()]) :: integer()
  @doc ~S"""
  Returns the length of an item, be it a string or a split item

  Returns the length of the item if it's a string, or the sum of the lengths of the left and right strings + 1 for the separator if it's a split item

  ## Examples

      iex> Rendering.RenderingUtils.get_length_of_item(["a", "b"])
      3
      iex> Rendering.RenderingUtils.get_length_of_item("abcd")
      4
  """
  def get_length_of_item([left, right]) when is_binary(left) and is_binary(right),
    do: get_length_of_item(left) + get_length_of_item(right) + 1

  def get_length_of_item(item), do: item |> String.length()
end
