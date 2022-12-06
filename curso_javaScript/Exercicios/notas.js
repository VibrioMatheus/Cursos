function getNota(nota) {
  let transformation

  if (nota >= 90) {
    transformation = 'A'
  } else if (nota >= 80 && nota <= 89) {
    transformation = 'B'
  } else if (nota >= 70 && nota <= 79) {
    transformation = 'C'
  } else if (nota >= 60 && nota <= 69) {
    transformation = 'D'
  } else {
    transformation = 'F'
  }

  return transformation
}

console.log(getNota(65))