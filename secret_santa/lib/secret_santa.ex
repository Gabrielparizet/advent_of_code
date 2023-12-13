defmodule SecretSanta do
  # Function to shuffle a list
  defp shuffle_list(list), do: Enum.shuffle(list)

  # Function to create secret santa assignments
  def secret_santa do
    ["Leo", "Agathe", "Olivia", "Gabriel", "Marie", "Jourde", "Dumail", "Bodin", "Suzanne", "Charles", "Charles girlfriend", "Martin", "Suzanne"]
    |> Enum.shuffle()
    |> create_secret_santa()
  end
  def create_secret_santa(names) when is_list(names) do
    assign_gifts(names, shuffle_list(names))
  end

  # Helper function to assign gifts to participants
  defp assign_gifts([], _), do: []
  defp assign_gifts([name | rest], shuffled_names) do
    {giver, shuffled_names_left} = find_valid_receiver(name, shuffled_names)
    [{name, giver} | assign_gifts(rest, shuffled_names_left)]
  end

  # Helper function to find a valid receiver for a participant
  defp find_valid_receiver(name, [receiver | rest]) when name != receiver do
    {receiver, rest}
  end
  defp find_valid_receiver(name, [_ | rest]) do
    shuffled_names = shuffle_list(rest ++ [name])
    find_valid_receiver(name, shuffled_names)
  end
end

# # Example usage
# names = ["Leo", "Agathe", "Olivia", "Gabriel", "Marie", "Jourde", "Dumail", "Bodin", "Suzanne", "Charles", "Charles girlfriend", "Martin", "Suzanne"]
# assignments = SecretSanta.create_secret_santa(names)
# IO.inspect(assignments)
