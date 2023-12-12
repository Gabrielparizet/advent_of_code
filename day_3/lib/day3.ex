defmodule Day3 do


  @top_left {-1, -1}
  @top {-1, 0}
  @top_right {-1, 1}
  @left {0, -1}
  @right {0, 1}
  @bottom_left {1, -1}
  @bottom {1, 0}
  @bottom_right {1, 1}

  @directions [@top_left, @top, @top_right, @left, @right, @bottom_left, @bottom, @bottom_right]

  def test do
    File.stream!("/Users/gabrielparizet/workspace/advent_of_code/day_3/lib/input2.txt")
    |> Enum.map(fn line -> String.trim(line) end)
    |> Enum.map(&(String.codepoints(&1)))
    |> create_base_grid()
    |> extract_part_numbers()
  end

  def create_base_grid(lines) do
    lines
    |> Enum.with_index()
    |> Enum.reduce(%{}, &create_grid_line/2)
  end

  def create_grid_line({chars, y}, grid) do
    Enum.with_index(chars)
      |> Enum.reduce(grid, &(create_grid_column(y, &1, &2)))
  end

  def create_grid_column(y, {char, x}, grid) do
    Map.put(grid, {y, x}, char)
  end

  def extract_part_numbers(grid) do
    Map.keys(grid)
    |> Enum.reduce({grid, []}, fn yx, {grid, part_numbers} ->
      case get_char_type(Map.get(grid, yx)) do
        :symbol -> fetch_part_numbers(yx, grid, part_numbers)
        _ -> {grid, part_numbers}
      end
    end)
  end

  def get_char_type("."), do: :point
  def get_char_type(char) do
    if Regex.match?(~r/\d/, char) do
      :digit
    else
      :symbol
    end
  end

  def fetch_part_numbers(yx, grid, part_numbers) do
    Enum.reduce(@directions, {grid, part_numbers}, fn direction, acc ->
      at = move_cursor(yx, direction)
      case is_digit?(grid, at) do
        true ->
          {new_grid, integer} = build_part_numbers(at, grid)
          {new_grid, [integer | acc]}
        _ -> {grid, acc}
      end
    end)
  end

  def move_cursor({y, x}, {y_dir, x_dir}) do
    {y + y_dir, x + x_dir}
  end

  def is_digit?(grid, at) do
    Map.has_key?(grid, at) && Regex.match?(~r/\d/, Map.get(grid, at))
  end

  def build_part_numbers(at, grid) do
    IO.inspect(at, label: "at", limit: 10)
    IO.inspect(grid, label: "grid", limit: 10)
    do_build_part_numbers(at, grid, [])
    |> IO.inspect(label: "result", limit: 10)
  end

  def do_build_part_numbers(at, grid, digits) do
    cond do
      is_digit?(grid, move_cursor(at, @left)) ->
        do_build_part_numbers(move_cursor(at, @left), grid, digits)
      is_digit?(grid, move_cursor(at, @right)) ->
          new_digits = [Map.get(grid, at) | digits]
          new_grid = Map.put(grid, at, ".")
          do_build_part_numbers(move_cursor(at, @right), new_grid, new_digits)
      true -> new_digits = [Map.get(grid, at) | digits]
              new_grid = Map.put(grid, at, ".")
              {new_grid, join_part_numbers(new_digits)}
    end
  end

  def join_part_numbers(digits) do
    digits
    |> Enum.reverse()
    |> Enum.join()
  end

end
