defmodule Day4 do
  @moduledoc """
  Documentation for `Day4`.
  """

  def scratchcards() do
    file_name = "/Users/gabrielparizet/workspace/advent_of_code/day_4/lib/input.txt"

    parsed_file =
      file_name
      |> parse()

    cards_list =
      parsed_file
      |> Enum.map(&create_card/1)

    winning_numbers_by_card =
      cards_list
      |> Enum.map(&count_winning_numbers/1)

    score_list = winning_numbers_by_card
    |> Enum.map(&calculate_score/1)

    Enum.reduce(score_list, 0, fn score, acc -> score + acc end)
  end

  defp parse(file) do
    file
    |> File.read!()
    |> String.split("\n")
  end

  defp create_card(card_string) do
    [_card_number | numbers] = String.split(card_string, [":", "|"], trim: true)
    [winning_numbers | my_numbers] = numbers

    %{
      winning_numbers: create_numbers_list(winning_numbers),
      my_numbers: create_numbers_list(List.to_string(my_numbers))
    }
  end

  defp create_numbers_list(numbers_string) do
    numbers_string
    |> String.split(" ", trim: true)
    |> Enum.map(fn num ->
      {number, _remainder_of_binary} = Integer.parse(num)
      number
    end)
  end

  defp count_winning_numbers(%{winning_numbers: winning_numbers, my_numbers: my_numbers}) do
    Enum.count(winning_numbers, &Enum.member?(my_numbers, &1))
  end

  defp calculate_score(0), do: 0
  defp calculate_score(1), do: 1
  defp calculate_score(2), do: 2
  defp calculate_score(number) when number > 2 do
    Enum.reduce(1..(number - 1), 1, fn(_, acc) -> acc * 2 end)
  end
end
