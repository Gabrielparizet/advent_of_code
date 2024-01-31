defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  alias Day1

  @sample_puzzle_input_list [
    184,
    205,
    211,
    213,
    227,
    225,
    224,
    228,
    232,
    231
  ]

  test "From a puzzle_input txt file, parse/1 should return the input as a list of integers" do
    puzzle_input_file = "priv/puzzle_input_test.txt"
    expected = @sample_puzzle_input_list
    result = Day1.parse(puzzle_input_file)
    assert result == expected
  end

  test "Comparing two integers, increased?/1 should return true if the second integer is greater than the previous " do
    int1 = 184
    int2 = 205

    assert Day1.increased?(int1, int2) == true
    assert Day1.increased?(int2, int1) == false
  end

  test "Browsing a list of integers, count_increase/1 should count the number of times increased/1 returned true while comparing the list elements in order" do
    expected = 6

    result = Day1.count_increase(@sample_puzzle_input_list, 0)

    assert result == expected
  end
end
