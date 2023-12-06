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
    line_list = Enum.map(input, &(String.split(&1, "", trim: true)))
    |> Enum.map(&(Enum.with_index(&1)))
    |> Enum.with_index()
    |> Enum.map(fn {line, index} -> %{index: index, line: line} end)

    symbols_list = get_symbols(input)

    line_numbers_list = Enum.map(input, &(String.split(&1, ["." | symbols_list], trim: true)))

    final_map = Enum.map(line_list, fn %{index: index, line: line} ->
      %{
        index: index,
        symbols_index: get_symbols_index(line, symbols_list),
        numbers_index: get_numbers_index(line),
      }
    end)
    Enum.zip(final_map, line_numbers_list)
    |> Enum.map(fn {map, numbers} ->
      Map.put(map, :numbers, numbers)
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

  defp get_numbers_index(line) do
    line
    |> Enum.map(fn {val, index} ->
      case String.contains?(val, @numbers) do
        true -> index
        _ -> "not_a_number"
      end
    end)
    |> Enum.filter(fn x -> x != "not_a_number" end)
  end

end
