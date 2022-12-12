function repeat(argument, repeticoes) {
  let array = []
  for (let i = 0; i < repeticoes; i++) {
    array.unshift(argument)
  }
  return array
}

console.log(repeat("Ola", 3))