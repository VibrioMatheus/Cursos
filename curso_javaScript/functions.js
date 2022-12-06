//Supor que quero criar um app de frases motivacionais
function createPhrases() {
  console.log('Estudar é muito bom')
  console.log('Insista, persista e nunca desista')
  console.log('Revisão é a mãe do aprendizado')

}

//function anonymous - função anonima
const sum = function (n1, n2) {
  let total = n1 + n2
  return total
}

console.log(sum(1, 2))

//Arrow Function
const sayMyName = (name) => {
  console.log(name)
}

sayMyName('Mathias')

//Callback function - função de parametro para outra função
function sayMyName(name) {
  console.log(name)
}

sayMyName(
  () => {
    console.log('estou em uma callback')
  }
)

//Function Constructor
function Person(name) {
  this.name = name
  this.walk = function () {
    return this.name + " esta andando"
  }
}

const mayk = new Person("Mayk")
console.log(mayk.walk())

  //Função auto executável
  (function () {
    console.log('alo')
  })()






