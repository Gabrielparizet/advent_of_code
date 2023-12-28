defmodule Day3 do
  @moduledoc """
  Documentation for `Day3`.
  """

  def count_houses do

    input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/2015/day_3/lib/input.txt")
    |> String.split("", trim: true)

    Enum.reduce(input, %{houses_count: 1, coordinates: {0, 0}, houses_position: []}, &(do_count_houses(&1, &2)))
  end

  def do_count_houses(direction, %{houses_count: houses_count, coordinates: {x, y}, houses_position: coordinate_list}) do
    case direction and coordinate_list do

    end
  end



end
