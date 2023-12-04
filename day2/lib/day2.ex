defmodule Day2 do

  # Game 1: 1 green, 1 blue, 1 red; 1 green, 8 red, 7 blue; 6 blue, 10 red; 4 red, 9 blue, 2 green; 1 green, 3 blue; 4 red, 1 green, 10 blue


  # 12 red, 13 green, 14 blue

  def possible? do
    input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/day2/lib/input2.txt")
    input_list = String.split(input, "\n")
    make_map(input_list)
  end

  ### MAKE_MAP()

  defp make_map(input_list) do
    %{games: Enum.reduce(input_list, %{}, fn x, acc ->
      Map.put(acc, get_id(x), get_sets(x))
    end)}
  end

  def get_id(line) do
    line
    |> String.split([":"])
    |> List.first()
    |> String.split("Game ", trim: true)
    |> List.to_string()
    |> String.to_integer()
  end

  defp get_sets(line) do
    line
    |> String.split([":"])
    |> get_tail()
    |> make_sets_map()
  end

  defp get_tail([_hd | tl]) do
    List.to_string(tl)
  end

  defp make_sets_map(list) do
    String.split(list, ";")
  end



  # defp do_make_games_map([hd | tail]) do
  #   id = String.split(hd, "Game ") |> List.to_string() |> String.to_integer()
  #   sets = tail
  #   %{id: id, sets: sets}
  # end

  # defp build_id_and_sets([id | sets]) do
  #   %{}
  # end

  # defp make_game(map) do
  #   map
  #   |> String.split([":", ";"])
  #   |> get_game()
  # end

  # defp get_game([id | sets]) do
  #   %{id: get_id(id), sets: Enum.map(sets, &(make_sets(&1)))}
  # end

  # defp get_id(id) do
  #   id
  #   |> String.split(["Game", " "], trim: true)
  #   |> List.to_string()
  #   |> String.to_integer()
  # end

  # defp make_sets(sets) do
  #   String.split(sets, ",")
  #   |> Enum.map(&make_pick(&1))
  # end

  # defp make_pick(pick) do
  #   String.split(pick, " ", trim: true)
  #   |> get_color_and_number
  # end

  # defp get_color_and_number([number | color]) do
  #   %{number: String.to_integer(number), color: List.to_string(color)}
  # end



  # ### DO_POSSIBLE?()

  # defp do_possible?(map) do
  #   map.sets
  # end
end
