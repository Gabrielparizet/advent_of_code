defmodule Day1B do

  def get_input_list() do
    "/Users/gabrielparizet/workspace/advent_of_code/day_1/lib/input.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> convert(x) end)
    |> Enum.map(fn x -> get_numbers_list(x) end)
    |> get_list_to_add()
    |> List.flatten()
    |> IO.inspect(label: "inspector")
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  defp get_numbers_list(string) do
    string
    |> String.split("", trim: true)
    |> Stream.map(fn x ->
      case is_number?(x) do
        true  -> x
        _ -> ""
      end
    end)
    |> Enum.reject(fn x -> x == "" end)
  end

  defp is_number?(char) do
    String.contains?(char, ["1", "2", "3", "4", "5", "6", "7", "8", "9"])
  end

  defp get_list_to_add(list) do
    Enum.reduce(list, [], fn x, acc ->
      case length(x) do
        1 ->  [deduple(x) | acc]
        2 ->  [Enum.join(x) | acc]
        _ -> [get_first_and_last(x) | acc]
      end
    end)
  end

  defp deduple(list) do
    Enum.map(list, fn x ->  x <> x end)
  end

  defp get_first_and_last(list) do
    [List.first(list), List.last(list)]
    |> Enum.join()
  end

  def convert(string) do
    string
    |> String.replace("oneight", "18")
    |> String.replace("twone", "21")
    |> String.replace("nineight", "98")
    |> String.replace("threeight", "38")
    |> String.replace("fiveight", "58")
    |> String.replace("sevenine", "79")
    |> String.replace("eightwo", "82")
    |> String.replace("eighthree", "83")
    |> String.replace("one", "1")
    |> String.replace("two", "2")
    |> String.replace("three", "3")
    |> String.replace("four", "4")
    |> String.replace("five", "5")
    |> String.replace("six", "6")
    |> String.replace("seven", "7")
    |> String.replace("eight", "8")
    |> String.replace("nine", "9")
  end


end
