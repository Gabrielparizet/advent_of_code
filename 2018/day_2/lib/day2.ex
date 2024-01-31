defmodule Day2 do
  @moduledoc """
  Documentation for `Day2`.
  """

  def calculate_checksum do
    parsed_input = "/Users/gabrielparizet/workspace/advent_of_code/2018/day_2/lib/input.txt"
    |> parse_input

    do_calculate_checksum(parsed_input)
  end

  def parse_input(input) do
    input
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, "", trim: true)))
  end

  def do_calculate_checksum(parsed_inout) do

  end
end
