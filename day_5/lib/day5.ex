defmodule Day5 do


  def count_floor do

    File.read!("/Users/gabrielparizet/workspace/advent_of_code/day_5/lib/input.txt")
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn sign, floor ->
      case sign do
        "(" -> floor + 1
        ")" -> floor - 1
      end
    end)


  end
end
