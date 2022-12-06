function convertTemp(temperatura) {
  const celsius = temperatura.toUpperCase().includes("C")
  const fahrenheit = temperatura.toUpperCase().includes("F")
  let newTemp

  if (!celsius && !fahrenheit) {
    throw new Error('Grau nao identificado')
  }
  if (fahrenheit) {
    newTemp = Number(temperatura.toUpperCase().replace("F", ""))
    newTemp = (newTemp - 32) * 5 / 9
  }
  if (celsius) {
    newTemp = Number(temperatura.toUpperCase().replace("C", ""))
    newTemp = newTemp * 9 / 5 + 32
  }

  return newTemp
}

try {
  console.log(convertTemp('32f'))
  console.log(convertTemp('33c'))
} catch (error) {
  console.log(error.message)
}

