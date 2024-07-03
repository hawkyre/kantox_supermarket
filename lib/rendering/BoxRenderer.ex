defmodule Rendering.BoxRenderer do
  alias Rendering.RenderingUtils

  @spec draw_box(list()) :: {:ok}
  @doc """
  Prints to console a box with the given text

  Expects:
  - A list of strings, each of which is an independent line of text
  - A list of lists, where each inner list is a list of either strings or split items ([left, right]) that will be spaced in between

  Returns {:ok}
  """
  def draw_box(binaries) when is_list(binaries) do
    binaries
    |> create_box_buffer()
    |> render_box()

    {:ok}
  end

  @spec create_box_buffer(list()) :: [String.t()]
  def create_box_buffer(binaries) when is_list(binaries) do
    width =
      Enum.max(
        binaries
        |> RenderingUtils.flatten_into_array_of_items()
        |> Enum.map(&RenderingUtils.get_length_of_item/1),
        fn -> 0 end
      )

    width_with_padding = width + 2

    buffer =
      [
        "╭" <> String.duplicate("─", width_with_padding) <> "╮"
      ] ++
        draw_inner_box(width, binaries) ++
        [
          "╰" <> String.duplicate("─", width_with_padding) <> "╯"
        ]

    buffer
  end

  defp render_box(buffer) do
    IO.puts(buffer |> Enum.join("\n"))
  end

  defp draw_inner_box(width, binaries) do
    binaries
    |> RenderingUtils.insert_white_lines()
    |> RenderingUtils.flatten_into_array_of_items()
    |> Enum.map(&draw_inner_box_item(width, &1))
  end

  defp draw_inner_box_item(width, [left, right]) do
    left_padded =
      left
      |> String.pad_trailing(width - String.length(right))

    "│ #{left_padded}#{right} │"
  end

  defp draw_inner_box_item(width, item) do
    string =
      item
      |> String.pad_trailing(width)

    "│ #{string} │"
  end
end
