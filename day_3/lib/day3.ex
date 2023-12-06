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
    |> Enum.with_index(1)
    |> Enum.map(&(create_matrix(&1)))
    |> Enum.map(&(group_numbers(&1)))
  end

  defp create_matrix({line, row_id}) do
    column = String.split(line, "", trim: true)
    |> Enum.with_index(1)
    Enum.map(column, fn {char, column_id} ->
      %{char: char, row_id: row_id, column_id: column_id}
    end)
  end

  defp group_numbers(line) do
    Enum.map(line, fn map ->
      case String.contains?(map.char, @numbers) do
        true -> map
        false -> "not_a_number"
      end
    end)
    |> Enum.filter(fn x -> x != "not_a_number" end)
    |> Enum.reduce([], fn%{char: _char, row_id: _row_id, column_id: column_id} = current_map, acc ->
      case acc do
        [] ->
          IO.inspect(current_map, label: "CURRENT MAP EMPTY CASE")
          [Map.update!(current_map, :column_id, fn x -> [x] end) | acc]
        [%{char: prev_char, row_id: _row_id, column_id: prev_column_ids} | rest]  ->
          IO.inspect(current_map, label: "CURRENT MAP EMPTY CASE")
          if List.first(prev_column_ids) + 1 == column_id do
            Map.update!(current_map, :char, fn current_char -> Enum.join([prev_char | current_char]) end)
            Map.update!(current_map, :column_id, fn current_column_id -> Enum.reverse([current_column_id | prev_column_ids]) end)
            List.replace_at(acc, 0, current_map)
          else
            [rest | current_map]
          end
      end
      # IO.inspect(acc, label: "acc2")
      # IO.inspect(acc, label: "turn2")
    end)
  end

  # def parse() do
  #   input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/day_3/lib/input2.txt")
  #   |> String.split("\n")
  #   line_list = Enum.map(input, &(String.split(&1, "", trim: true)))
  #   |> Enum.map(&(Enum.with_index(&1)))
  #   |> Enum.with_index()
  #   |> Enum.map(fn {line, index} -> %{index: index, line: line} end)

  #   symbols_list = get_symbols(input)

  #   line_numbers_list = Enum.map(input, &(String.split(&1, ["." | symbols_list], trim: true)))

  #   parsed_data = Enum.map(line_list, fn %{index: index, line: line} ->
  #     %{
  #       index: index,
  #       symbols_index: get_symbols_index(line, symbols_list),
  #       numbers: %{
  #         index: get_numbers_index(line)
  #       }
  #     }
  #   end)

  #   Enum.zip(parsed_data, line_numbers_list)
  #   |> Enum.map(fn {map, numbers_list} ->
  #     Map.update!(map, :numbers, fn numbers_map ->
  #       Map.put(numbers_map, :numbers_list, numbers_list)
  #     end)
  #   end)
  #   |> Enum.map(fn line ->
  #     Map.update!(line, :numbers, fn %{index: index, numbers_list: numbers_list} ->
  #       group_index_with_number(index, numbers_list)
  #     end)
  #   end)
  #   |> Enum.map(fn line -> extract_isolated_numbers(line) end)

  # end

  # defp get_symbols(input) do
  #   input
  #   |> Enum.join()
  #   |> String.split(["." | @numbers], trim: true)
  #   |> Enum.uniq()
  # end

  # defp get_symbols_index(line, symbols_list) do
  #   line
  #   |> Enum.map(fn {val, index} ->
  #     case String.contains?(val, symbols_list) do
  #       true -> index
  #       _ -> "not_a_symbol"
  #     end
  #   end)
  #   |> Enum.filter(fn x -> x != "not_a_symbol" end)
  # end

  # defp get_numbers_index(line) do
  #   line
  #   |> Enum.map(fn {val, index} ->
  #     case String.contains?(val, @numbers) do
  #       true -> index
  #       _ -> "not_a_number"
  #     end
  #   end)
  #   |> Enum.filter(fn x -> x != "not_a_number" end)
  # end

  # defp group_index_with_number(index, numbers_list) do
  #   length = Enum.map(numbers_list, &(String.length(&1)))
  #   grouped_indexes = %{index: index, numbers_list: length}
  #   |> group_indexes()
  #   Enum.zip(grouped_indexes, numbers_list)
  #   |> Enum.map(fn {indexes, numbers} ->
  #     %{indexes: indexes, number: numbers}
  #   end)
  # end

  # defp group_indexes(map) do
  #   group_indexes(map.index, map.numbers_list, [])
  # end

  # defp group_indexes(_, [], acc) when is_list(acc) do
  #   Enum.reverse(acc)
  # end

  # defp group_indexes(index, [count | counts], acc) when is_list(acc) do
  #   {group, rest} = Enum.split(index, count)
  #   group_indexes(rest, counts, [group | acc])
  # end

  # defp extract_isolated_numbers(%{index: _, numbers: numbers_list, symbols_index: symbols_index}) do
  #   Enum.map(numbers_list, fn map ->
  #     find_adjacent_numbers(map.indexes, symbols_index)
  #   end)

  # end

  # defp find_adjacent_numbers(indexes, symbols_indexes) do
  #   IO.inspect(indexes, label: "indexes")
  #   IO.inspect(symbols_indexes)
  #   Enum.filter(indexes, fn idx ->
  #     Enum.member?([idx - 1, idx, idx + 1], Enum.each(symbols_indexes, fn x -> x end))
  #   end)
  # end
end
