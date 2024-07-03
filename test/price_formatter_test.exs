defmodule PriceFormatterTest do
  use ExUnit.Case

  test "should insert empty string arrays at the beginning, end and between items / &Rendering.RenderingUtils.insert_white_lines/1" do
    assert Rendering.RenderingUtils.insert_white_lines([[1], [2], [3]]) == [
             [""],
             [1],
             [""],
             [2],
             [""],
             [3],
             [""]
           ]
  end

  test "should insert empty string arrays at the beginning and end when there's only one element / &Rendering.RenderingUtils.insert_white_lines/1" do
    assert Rendering.RenderingUtils.insert_white_lines([[1]]) == [[""], [1], [""]]
  end

  test "should not insert empty string arrays when there's no elements / &Rendering.RenderingUtils.insert_white_lines/1" do
    assert Rendering.RenderingUtils.insert_white_lines([]) == []
  end

  test "should not alter lists of strings / &Rendering.RenderingUtils.flatten_into_array_of_items/1" do
    assert Rendering.RenderingUtils.flatten_into_array_of_items(["a", "b"]) == ["a", "b"]
  end

  test "should flatten lists of lists of strings into a list of strings / &Rendering.RenderingUtils.flatten_into_array_of_items/1" do
    assert Rendering.RenderingUtils.flatten_into_array_of_items([
             ["one", "two"],
             [""],
             ["three", "four"]
           ]) == ["one", "two", "", "three", "four"]
  end

  test "should not flat inner lists / &Rendering.RenderingUtils.flatten_into_array_of_items/1" do
    assert Rendering.RenderingUtils.flatten_into_array_of_items([
             [["item1", 200]],
             [""],
             [["item2", 200]],
             ["item3"]
           ]) == [["item1", 200], "", ["item2", 200], "item3"]
  end
end
