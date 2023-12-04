defmodule Day2 do

  # Game 1: 1 green, 1 blue, 1 red; 1 green, 8 red, 7 blue; 6 blue, 10 red; 4 red, 9 blue, 2 green; 1 green, 3 blue; 4 red, 1 green, 10 blue


  # 12 red, 13 green, 14 blue

  def possible?() do
    input = File.read!("/Users/gabrielparizet/workspace/advent_of_code/day2/lib/input2.txt")
    |> String.split("\n", trim: true)
    |> Enum.with_index(1)
    |> make_map()

  end

  defp make_map(list) do
    Enum.reduce(list, %{}, fn {sets, index}, acc ->
      Map.put(acc, index, make_sets(sets))
    end)
  end

  defp make_sets(sets) do
    [_ | tl] = String.split(sets, ":")
    tl
    |> List.to_string()
    |> String.split(";")
    |> Enum.map(&(make_pick(&1)))
  end

  defp make_pick(set) do
    set
    |> String.split(",")
    |> Enum.map(&(make_color_quantity_pair(&1)))
  end

  defp make_color_quantity_pair(pick) do
    pick_list = String.split(pick, " ", trim: true)
    List.to_tuple(pick_list)
    |> is_pick_possible?()
  end

  defp is_pick_possible?({quantity, color} = {_, "red"}) do
    case String.to_integer(quantity) <= 12 do
      true -> {quantity, color}
      false -> :error
    end
  end

  defp is_pick_possible?({quantity, color} = {_, "green"}) do
    case String.to_integer(quantity) <= 13 do
      true -> {quantity, color}
      false -> :error
    end
  end

  defp is_pick_possible?({quantity, color} = {_, "blue"}) do
    case String.to_integer(quantity) <= 14 do
      true -> {quantity, color}
      false -> :error
    end
  end

end












  # defp make_map(input_list) do
  #   Enum.reduce(input_list, %{}, fn x, acc ->
  #     [id | sets ] = String.split(x, ":")
  #     Map.put(acc, get_id(id), sets)
  #     end)
  # end

  # # defp make_game(games) do
  # #   [id | sets] = String.split(games, ":")
  # #   %{id: get_id(id), sets: sets}
  # # end

  # defp get_id(game_id) do
  #   game_id
  #   |> String.split("Game ", trim: true)
  #   |> List.to_string()
  #   |> String.to_integer()
  # end

  # defp make_sets(sets) do
  #   sets
  #   |> Enum.reduce(%{}, fn x, acc ->
  #     sets_list = String.split(x, ";")
  #     Map.put(acc, :set, sets_list)
  #   end)
  #   # |> List.to_string()
  #   # |> String.split(";")
  #   # |> Enum.map(&(get_set(&1)))
  # end

  # defp get_set(set) do
  #   set
  #   |> String.split(",")
  #   |> Enum.map(&(get_pick(&1)))
  # end

  # defp get_pick(pick) do
  #   [quantity | color] = String.split(pick, " ", trim: true)
  #   pick_map = %{quantity: quantity, color: color}
  # end
