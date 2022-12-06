//Type conversion vs Type Coersion
let string = '9'
number(string)

let number = 321
String(number)

//Contar quantos caracteres tem uma palavra e quantos digitos tem um numero
let word = "Geladeira"
word.length

let number2 = 1234
String(number2).length

//Transformar um numero quebrado com 2 casas decimais e trocar ponto por virgula
number = 12.3213212
number.toFixed(2).replace(".", ",") // o retorno do toFixed é uma string, por isso conseguimos usar o replace

//Transformando letras minusculas em maiusculas
let phrase = "Programa é muito bacana!"
phrase.toUpperCase() // tudo maiusculo
phrase.toLowerCase() // tudo minusculo

/*Separando um texto que contem espaços, em um novo array onde
cada texto é uma posição do array. Depois disso, transforme o array
em um texto e onde eram espaços, coloque
*/
phrase = "Eu quero viver o Amor!"
let myArray = phrase.split(" ") // separando a frase a cada espaço
let phraseWithUnderscore = myArray.join("_") //juntando o array com underscore

//Verificar se o texto contem uma palavra especifica
phrase.includes("Amor") // retorna true or false

//Criar Array com construtor
let array = new Array(10) // criando array com 10 posições
let array2 = new Array('a', 'b', 'c') // iniciando array com abc

//Contar elementos de um array
array2.length

//Transformar uma cadeia de caracteres em elementos de um array
word = "manipulação"
Array.from(word) // cada letra irá virar uma posição do array

//Manipulação de Array
let techs = [
  "html",
  "css",
  "js",
  "golang",
  "c++"
]

techs.push("nodejs") // adicionar um item no fim
techs.unshift("sql") // adicionar um item no começo
techs.pop() // remover do fim do array
techs.shift() // remover do começo
console.log(techs.slice(1, 3))//pegar somente alguns elementos do array
techs.splice(1, 1)//remover 1 ou mais items em qualquer posiçao do array (pos,qtde)
let pos = techs.indexOf('css')//encontrar a posição de um elemento no array






