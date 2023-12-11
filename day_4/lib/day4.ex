defmodule Day4 do
  @moduledoc """
  Documentation for `Day4`.
  """

  def scratchcards() do
    input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/day_4/lib/input.txt")
    |> parse()
    |> find_match_number()
    |> IO.inspect(label: "points")
    |> Enum.map(&(calculate(&1)))
    |> IO.inspect(label: "numbers_list")
    |> Enum.reduce(0, fn nb, acc ->
        nb + acc
      end)
  end

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn row ->
      [card_number | numbers] = String.split(row, ":")
      numbers = List.to_string(numbers)
      [winning_numbers | numbers_you_have] = String.split(numbers, "|")
      numbers_you_have = List.to_string((numbers_you_have))
      %{card_number: get_card_number(card_number), winning_numbers: get_numbers_list(winning_numbers), numbers_you_have: get_numbers_list(numbers_you_have)}
    end)
  end

  def get_card_number(card_number) do
    card_number
    |> String.split(["Card", " "], trim: true)
    |> List.to_string()
    |> String.to_integer()
  end

  def get_numbers_list(numbers_list) do
    numbers_list
    |> String.split(" ", trim: true)
  end

  def find_match_number(input) do
    input
    |> Enum.map(fn map ->
      Enum.reduce(map.winning_numbers, 0, fn number, acc ->
        case String.contains?(number, map.numbers_you_have) do
          true -> acc + 1
          false -> acc
        end
      end)
    end)
    |> Enum.filter(fn nb -> nb != 0 end)
  end

  def calculate(input) when input > 0 do
    calculate_recursive(1, input-1)
  end

  def calculate_recursive(result, 0), do: result

  def calculate_recursive(result, input) do
    new_input = input - 1
    new_result = result * 2
    calculate_recursive(new_result, new_input)
  end
end
