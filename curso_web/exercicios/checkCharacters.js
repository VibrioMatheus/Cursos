function checkCharacters(character, word) {
  let myArray = word.split(" ")
  console.log(myArray)
  let count = 0
  for (let i = 0; i < myArray.length; i++) {
    let word = myArray[i]
    if (word.includes(character))
      count++
  }
  console.log(count)
}

checkCharacters("r", "A sorte favorece os audazes")