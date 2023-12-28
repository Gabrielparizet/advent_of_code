defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """
  def calculate_frequency do
    parsed_input = "/Users/gabrielparizet/workspace/advent_of_code/2018/day_1/lib/input.txt"
    |> parse_input()

    operations_list = parse_operation(parsed_input)

    do_calculate_frequency(operations_list)

  end

  defp parse_input(path) do
    path
    |> File.read!()
    |> String.split("\n")
  end

  defp parse_operation(parse_input)do
    parse_input
    |> Enum.map(fn operation ->
      [operator | numbers] = String.split(operation, "", trim: true)
      number = Enum.join(numbers) |> String.to_integer()
      %{operator: operator, number: number}
    end)
  end

  defp do_calculate_frequency(operations_list) do
    Enum.reduce(operations_list, 0, fn operation, acc ->
      case operation.operator do
        "+" -> acc + operation.number
        "-" -> acc - operation.number
      end
    end)
  end
end
