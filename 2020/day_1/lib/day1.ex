defmodule Day1 do
  def get_two_entries do
    "lib/input.txt"
    |> parse()
    |> separate_numbers()
  end

  def parse(input) do
    input
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def separate_numbers(numbers_list) do
    numbers_list
    |> Enum.reduce([{}, {}], &(more_than_a_thousand(&1, &2)))
  end

  def more_than_a_thousand(number, acc) do
    [oneth | lessth] = acc
    IO.inspect(oneth, label: "moreth")
    lesser_tuple = List.first(lessth)
    IO.inspect(lesser_tuple, label: "lesser_tuple")
    case number >= 1000 do
      true -> Tuple.append(oneth, number)
      false -> Tuple.append(lesser_tuple, number)
    end
  end
end
