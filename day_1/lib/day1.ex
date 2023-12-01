defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  def get_input_list() do
    "/Users/gabrielparizet/workspace/advent_of_code/day_1/lib/input.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn x -> get_numbers_list(x) end)
    |> get_list_to_add()
    |> List.flatten()
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  defp get_numbers_list(string) do
    string
    |> String.split("", trim: true)
    |> Stream.map(fn x ->
      case is_number?(x) do
        true  -> x
        _ -> ""
      end
    end)
    |> Enum.reject(fn x -> x == "" end)
  end

  defp is_number?(char) do
    String.contains?(char, ["1", "2", "3", "4", "5", "6", "7", "8", "9"])
  end

  defp get_list_to_add(list) do
    Enum.reduce(list, [], fn x, acc ->
      case length(x) do
        1 ->  [deduple(x) | acc]
        2 ->  [Enum.join(x) | acc]
        _ -> [get_first_and_last(x) | acc]
      end
    end)
  end

  defp deduple(list) do
    Enum.map(list, fn x ->  x <> x end)
  end

  defp get_first_and_last(list) do
    [List.first(list), List.last(list)]
    |> Enum.join()
  end

end
