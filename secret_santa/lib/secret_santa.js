let nameList = [
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
  "Charles girlfriend",
];

function shuffleArray(array) {
  for (var i = array.length - 1; i > 0; i--) {
    var j = Math.floor(Math.random() * (i + 1));
    var temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }
}

function secret_santa(name_list) {
  shuffleArray(nameList);
  let nouvelle_liste = [];
  for (i = 0; i <= name_list.length; i + 2) {
    nouvelle_liste.push(name_list[i]);
    nouvelle_liste.push(name_list[i + 1]);
  }
  if (nouvelle_liste.length > 10) {
    let last_match = nouvelle_liste[0];
    console.log(last_match);
    nouvelle_liste.push(last_match);
    console.log(nouvelle_liste);
  }
}

secret_santa(nameList);
