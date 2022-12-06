let receitas = [20, 30, 43, 32, 123]
let despesas = [12, 43]

function calculeReceitas() {
  let total = 0.0
  for (let i = 0; i < receitas.length; i++) {
    total = total + receitas[i]
  }
  return total
}


function calculeDespesas() {
  let total = 0.0
  for (let i = 0; i < despesas.length; i++) {
    total = total + despesas[i]
  }
  return total
}

let totalReceitas = calculeReceitas()
let totalDespesas = calculeDespesas()

if (totalReceitas > totalDespesas) {
  console.log(`Vc está com o saldo positivo de ${totalReceitas}`)
} else {
  console.log(`Vc está com o saldo negativo de ${totalReceitas}`)
}

