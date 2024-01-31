defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  def run do
    "priv/input.txt"
    |> parse()
    |> count_increase(0)
  end

  def parse(input) do
    input
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  def increased?(int1, int2) do
    if int1 < int2 do
      true
    else
      false
    end
  end

  def count_increase([_last], acc), do: acc

  def count_increase([first | rest], acc) do
    next = hd(rest)

    if increased?(first, next) do
      count_increase(rest, acc + 1)
    else
      count_increase(rest, acc)
    end
  end
end
