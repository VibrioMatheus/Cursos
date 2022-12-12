
let array = [1, "Batata", 2, 5, 6, "Coxinha"]

function filtraNumeros(array) {
  let numbers = []

  for (let i = 0; i < array.length; i++) {
    let type = typeof (array[i])
    if (type == "number") {
      numbers.push(array[i])
    }
  }
  return numbers
}

console.log(filtraNumeros(array))




