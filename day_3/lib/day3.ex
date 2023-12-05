defmodule Day3 do

  def parse() do
    File.read!("/Users/gabrielparizet/workspace/advent_of_code/day_3/lib/input2.txt")
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, "", trim: true)))
    |> Enum.map(&(Enum.with_index(&1)))
  end
end
