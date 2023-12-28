defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  describe "Taking an input, create_base_grid/1 should create" do


    test "create_base_grid/1, taking as input lines will create a grid" do
      lines = [
        ["4", "6", "7", ".", ".", "1", "1", "4", ".", "."],
        [".", ".", ".", "*", ".", ".", ".", ".", ".", "."],
        [".", ".", "3", "5", ".", ".", "6", "3", "3", "."],
        [".", ".", ".", ".", ".", ".", "#", ".", ".", "."],
        ["6", "1", "7", "*", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", "+", ".", "5", "8", "."],
        [".", ".", "5", "9", "2", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "7", "5", "5", "."],
        [".", ".", ".", "$", ".", "*", ".", ".", ".", "."],
        [".", "6", "6", "4", ".", "5", "9", "8", ".", "."]
      ]

      assert Day3.create_base_grid(lines) == %{
        {4, 5} => ".",
        {5, 9} => ".",
        {1, 2} => ".",
        {8, 5} => "*",
        {0, 9} => ".",
        {8, 6} => ".",
        {5, 2} => ".",
        {3, 6} => "#",
        {2, 4} => ".",
        {4, 8} => ".",
        {6, 5} => ".",
        {0, 3} => ".",
        {1, 1} => ".",
        {9, 6} => "9",
        {4, 3} => "*",
        {3, 7} => ".",
        {5, 0} => ".",
        {0, 5} => "1",
        {0, 1} => "6",
        {8, 9} => ".",
        {4, 0} => "6",
        {3, 2} => ".",
        {9, 8} => ".",
        {8, 1} => ".",
        {7, 3} => ".",
        {7, 9} => ".",
        {0, 8} => ".",
        {3, 1} => ".",
        {6, 1} => ".",
        {2, 0} => ".",
        {8, 3} => "$",
        {8, 4} => ".",
        {2, 7} => "3",
        {4, 6} => ".",
        {9, 4} => ".",
        {6, 2} => "5",
        {0, 7} => "4",
        {9, 0} => ".",
        {7, 2} => ".",
        {0, 0} => "4",
        {8, 7} => ".",
        {5, 8} => "8",
        {7, 6} => "7",
        {2, 8} => "3",
        {1, 4} => ".",
        {5, 6} => ".",
        {9, 5} => "5",
        {6, 6} => ".",
        {9, 3} => "4",
        {0, 4} => ".",
        {6, 8} => ".",
        {1, 7} => ".",
        {4, 2} => "7",
        {8, 8} => ".",
        {2, 3} => "5",
        {1, 8} => ".",
        {8, 2} => ".",
        {3, 4} => ".",
        {7, 5} => ".",
        {2, 1} => ".",
        {7, 0} => ".",
        {7, 8} => "5",
        {4, 7} => ".",
        {3, 3} => ".",
        {3, 0} => ".",
        {4, 9} => ".",
        {9, 1} => "6",
        {7, 7} => "5",
        {6, 0} => ".",
        {7, 1} => ".",
        {5, 3} => ".",
        {1, 6} => ".",
        {4, 1} => "1",
        {5, 5} => "+",
        {8, 0} => ".",
        {1, 9} => ".",
        {9, 2} => "6",
        {6, 4} => "2",
        {3, 5} => ".",
        {1, 0} => ".",
        {2, 6} => "6",
        {1, 5} => ".",
        {9, 7} => "8",
        {5, 1} => ".",
        {2, 5} => ".",
        {2, 2} => "3",
        {5, 7} => "5",
        {6, 9} => ".",
        {0, 2} => "7",
        {4, 4} => ".",
        {7, 4} => ".",
        {0, 6} => "1",
        {6, 7} => ".",
        {3, 8} => ".",
        {6, 3} => "9",
        {5, 4} => ".",
        {1, 3} => "*",
        {9, 9} => ".",
        {3, 9} => ".",
        {2, 9} => "."
      }
    end


    test "create_grid_line/2 taking as input a tuple containing a list of chars and their y dindex, and a grid of chars and their indexes should add these chars and their indexes to the list" do
      {chars, y} = {["4", "6", "7", ".", ".", "1", "1", "4", ".", "."], 0}
      grid = %{}

      assert Day3.create_grid_line({chars, y}, grid) == %{
        {0, 0} => "4",
        {0, 1} => "6",
        {0, 2} => "7",
        {0, 3} => ".",
        {0, 4} => ".",
        {0, 5} => "1",
        {0, 6} => "1",
        {0, 7} => "4",
        {0, 8} => ".",
        {0, 9} => "."
      }
    end


    test "create_grid_colum/3 taking as input a y index, a tuple containing a char and its x index as well a grid should add that chars and its coordinates to the grid" do
      y = 0
      {char, x} = {"4", 0}
      grid = %{}

      assert Day3.create_grid_column(y, {char, x}, grid) == %{{0, 0} => "4"}
    end
  end



  describe "Extract Part Numbers" do

    test "move_cursors taking coordinates {y, x} and a should return new coordinates" do
      {y, x} = {8, 5}
      {y_dir, x_dir} = {-1, -1}

      assert Day3.move_cursor({y, x}, {y_dir, x_dir}) == {7, 4}
    end


    test "is_digit?/1 taking a grid and a char coordinates present in the grit but which is not a digit should return false" do
      grid = %{
        {9, 3} => "4",
        {0, 4} => ".",
        {6, 8} => ".",
        {1, 7} => ".",
        {4, 2} => "7",
        {8, 8} => ".",
        {2, 3} => "5",
        {1, 8} => ".",
        {8, 2} => ".",
        {3, 4} => ".",
        {7, 5} => ".",
        {2, 1} => ".",
        {7, 0} => ".",
        {7, 8} => "5",
        {4, 7} => ".",
        {7, 4} => ".",
      }
      at = {7, 4}

      assert Day3.is_digit?(grid, at) == false
    end


    test "is_digit?/1 taking a grid and a char coordinates which is not a present in the grid should return false" do
      grid = %{
        {9, 3} => "4",
        {0, 4} => ".",
        {6, 8} => ".",
        {1, 7} => ".",
        {4, 2} => "7",
        {8, 8} => ".",
        {2, 3} => "5",
        {1, 8} => ".",
        {8, 2} => ".",
        {3, 4} => ".",
        {7, 5} => ".",
        {2, 1} => ".",
        {7, 0} => ".",
        {7, 8} => "5",
        {4, 7} => ".",
        {7, 4} => ".",
      }
      at = {9, 6}

      assert Day3.is_digit?(grid, at) == false
    end

    test "is_digit/1 taking a grid and char coordinates which is present in the grid and which value is a digit should return true" do
      grid = %{
        {9, 3} => "4",
        {0, 4} => ".",
        {6, 8} => ".",
        {1, 7} => ".",
        {4, 2} => "7",
        {8, 8} => ".",
        {2, 3} => "5",
        {1, 8} => ".",
        {8, 2} => ".",
        {3, 4} => ".",
        {7, 5} => ".",
        {2, 1} => ".",
        {7, 0} => ".",
        {7, 8} => "5",
        {4, 7} => ".",
        {7, 4} => ".",
      }
      at = {9, 3}

      assert Day3.is_digit?(grid, at) == true
    end

    test "join_part_numbers/1 taking a list of digits as input should return the desired part number, being the digits inversed in order and joined as one" do
      digits = ["4", "6", "7"]

      assert Day3.join_part_numbers(digits) == "764"
    end


    # test "build_part_numbers/"



  end

end
