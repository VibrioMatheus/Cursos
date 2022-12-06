//Uso de new
let name = new String('Mayk')
name.surName = "Brito"
let age = new Number(23)

let data = new Date('2020-12-01') // Converte em formato de data

//Operadores unários
const person = {
  name: 'Mayk',
  age: 25
}

delete person.age
console.log(typeof person) // tipo que person é

//Operadores aritiméticos
/*
  + soma
  / divisao
  * multiplicação
  - subtração
  % resto da divisão
  var++ incremeto
  var-- decremento
  ** exponencial
*/

//Operadores de comparação
/*
  == igual a (retorna true ou false)
  != diferente de (retorna true ou false)
  === estritamente igual a (compara valor e tipo)
  !== estritamente diferente de
*/

//Operações de atribuição (Assignment)
/*
  +=
  -=
  *=
  /=
*/

//Operadores lógicos
/*
  AND &&
  OR ||
  NOT !
*/

//Operador Condicional (ternário)
let pao = true
let queijo = true

const niceBreakfast = pao && queijo ? 'Cafe top' : 'Cafe ruim' // Condição entao valor 1 se nao valor 2

