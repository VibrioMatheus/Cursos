Caneta = {
  id: 20,
  nome: "caneta",
  descricao: "Nao Preenchido"
}

function removePropriedade(obj, categoria) {
  const copia = Object.assign({}, obj)
  delete copia[categoria]

  return copia
}


console.log(removePropriedade(Caneta, "descricao"))