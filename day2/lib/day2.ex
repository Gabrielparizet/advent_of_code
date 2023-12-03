defmodule Day2 do

  # Game 1: 1 green, 1 blue, 1 red; 1 green, 8 red, 7 blue; 6 blue, 10 red; 4 red, 9 blue, 2 green; 1 green, 3 blue; 4 red, 1 green, 10 blue


  # 12 red, 13 green, 14 blue

  def possible? do
    input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/day2/lib/input2.txt")
    |> make_map()
    # |> do_possible?()
  end



  ### MAKE_MAP()

  defp make_map(input) do
    input
    |> String.split("\n")
    |> Enum.map(&(make_game(&1)))

  end

  defp make_game(map) do
    map
    |> String.split([":", ";"])
    |> get_game()
  end

  defp get_game([id | sets]) do
    %{id: get_id(id), sets: Enum.map(sets, &(make_sets(&1)))}
  end

  defp get_id(id) do
    id
    |> String.split(["Game", " "], trim: true)
    |> List.to_string()
    |> String.to_integer()
  end

  defp make_sets(sets) do
    String.split(sets, ",")
    |> Enum.map(&make_pick(&1))
  end

  defp make_pick(pick) do
    String.split(pick, " ", trim: true)
    |> get_color_and_number
  end

  defp get_color_and_number([number | color]) do
    %{number: String.to_integer(number), color: List.to_string(color)}
  end



  ### DO_POSSIBLE?()

  defp do_possible?(map) do
    map.sets
  end
end
