defmodule SecretSanta do

  def secret_santa() do
    name_list = [
      "Olivia",
      "Gabriel",
      "Suzanne",
      "Agathe",
      "Marie",
      "Martin",
      "Lois",
      "Leo",
      "Jourde",
      "Charles",
      "Charles girlfriend"
    ]
    new_list = Enum.shuffle(name_list)
    Enum.zip(new_list, Enum.shuffle(name_list))
  end

end
