Compras = [
  {
    nome: "Jornal Online",
    categoria: "Informação",
    preco: 89.99
  },
  {
    nome: "Cinema",
    categoria: "Entretenimento",
    preco: 150
  }
]

function CalculaDespesas(array) {
  let despesas = 0
  for (let i = 0; i < array.length; i++) {
    despesas += array[i].preco
  }
  return despesas
}

console.log(CalculaDespesas(Compras))