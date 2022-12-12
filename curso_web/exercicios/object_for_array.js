const person = {
  nome: "Maria",
  profissao: "Desenvolvedora"
}

function objetoParaArray(obj) {
  const resultado = []

  for (let chave in obj)
    resultado.push([chave, obj[chave]])

  return resultado
}

console.log(objetoParaArray(person))

