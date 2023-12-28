defmodule Day2 do

  ############### PART 1 ################
  def count_wrapping_paper_dimensions do
    input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/2015/day_2/lib/input.txt")

    gifts_list = parse_input(input)
    |> IO.inspect(label: "gifts list")

    gifts_dimensions_list = Enum.map(gifts_list, &calculate_gift_dimensions/1)

    Enum.reduce(gifts_dimensions_list, fn number, acc -> number + acc end)

  end

  def parse_input(input) do
    input
    |> String.split("\n")
    |> Enum.map(&create_gifts/1)
  end

  def create_gifts(line) do
    line
    |> String.split("x")
    |> Enum.map(&(String.to_integer(&1)))
    |> get_dimensions()
  end

  def get_dimensions([length, width, height]) do
    %{length: length, width: width, height: height}
  end

  def calculate_gift_dimensions(gift) do
    sides_dimensions = %{
      lw: 2 * gift.length * gift.width,
      wh: 2 * gift.width  * gift.height,
      hl: 2 * gift.height * gift.length
    }
    smallest_side = find_smallest_side(sides_dimensions)

    gift_sides_size = sides_dimensions.lw + sides_dimensions.wh + sides_dimensions.hl
    gift_sides_size + smallest_side
  end

  def find_smallest_side(%{lw: lw, wh: wh, hl: hl}) do
    [lw, wh, hl]
    |> Enum.sort(:asc)
    |> List.first()
    |> div(2)
  end

  ############### PART 2 ################
  def count_ribbon_needed do
    input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/2015/day_2/lib/input.txt")

    gifts_list = parse_input(input)

    ribbon_for_wrapping_list = Enum.map(gifts_list, &count_ribbon/1)

    Enum.reduce(ribbon_for_wrapping_list, 0, fn num, acc -> num + acc end)
  end

  def count_ribbon(%{length: length, width: width, height: height}) do
    dimension_list_sorted = Enum.sort([length, width, height], :asc)
    [smallest | rest] = dimension_list_sorted
    [middle | greatest] = rest
    IO.inspect(smallest, label: "smallest")
    IO.inspect(middle, label: "middle")
    IO.inspect(greatest, label: "greatest")
    wrapping = (smallest * 2) + (middle * 2)
    bow = length * width * height
    wrapping + bow
  end
end
