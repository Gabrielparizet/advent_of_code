defmodule Day3 do

  @numbers [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ]

  def parse() do
    input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/day_3/lib/input2.txt")
    |> String.split("\n")

    symbols_list = get_symbols(input)


    line_list = Enum.map(input, &(String.split(&1, "", trim: true)))
    |> Enum.map(&(Enum.with_index(&1)))
    |> Enum.with_index()
    |> Enum.map(fn {line, index} -> %{index: index, line: line} end)

    symbols_index_lines = Enum.map(line_list, fn %{index: index, line: line} ->
      %{index: index, symbols_index: get_symbols_index(line, symbols_list)}
    end)


  end

  defp get_symbols(input) do
    input
    |> Enum.join()
    |> String.split(["." | @numbers], trim: true)
    |> Enum.uniq()
  end

  defp get_symbols_index(line, symbols_list) do
    line
    |> Enum.map(fn {val, index} ->
      case String.contains?(val, symbols_list) do
        true -> index
        _ -> "not_a_symbol"
      end
    end)
    |> Enum.filter(fn x -> x != "not_a_symbol" end)
  end
end
