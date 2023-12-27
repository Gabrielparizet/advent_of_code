defmodule Day5 do

  def part_1 do

    File.read!("/Users/gabrielparizet/workspace/advent_of_code/day_5/lib/input.txt")
    |> String.split("", trim: true)
    |> Enum.reduce(0, fn sign, floor ->
      case sign do
        "(" -> floor + 1
        ")" -> floor - 1
      end
    end)


  end

  def part_2 do

    sign_list = File.read!("/Users/gabrielparizet/workspace/advent_of_code/day_5/lib/input.txt")
    |> String.split("", trim: true)

    count_floor(sign_list)
  end

  defp count_floor(sign_list) do
    sign_list
    |> Enum.reduce({0, 0}, &(do_count_floor(&1, &2)))
  end

  defp do_count_floor(_, {-1, position}), do: position
  defp do_count_floor(sign, {floor, position}) do
    case sign do
      "(" -> {floor + 1, position + 1}
      ")" -> {floor - 1, position + 1}
    end
  end

end
