// IF ELSE
let temperature = 36.5

if (temperature >= 37) {
  console.log("Febre")
} else {
  console.log("Temperatura normal")
}

//Switch case
function calculate(number1, operator, number2) {
  let result = 0

  switch (operator) {
    case '+':
      result = number1 + number2
      break;
    case '-':
      result = number1 - number2
      break;
    case '*':
      result = number1 * number2
      break;
    case '/':
      result = number1 / number2
    default:
      console.log("Operador nao aceitado")
      break;
  }

  return result
}

//Try, Catch e Throw
function sayMyName(name = '') {
  if (name === '') {
    throw new Error("Nome é necessário")
  }

  console.log(name)
}

try {
  sayMyName()
} catch (e) {
  console.log(e)
}

//FOR (break para a execução do loop, continue pula a execução do momento)
for (let i = 0; i < 10; i++) {

}

//WHILE, quando nao sabemos o momento da parada
let i = 0
while (i < 10) {
  i++;
}

//for...of
let name = 'Mayk'
let names = ['Joao', 'Paulo', 'Pedro']

for (let char of name) {
  console.log(char)
}

//for...in
let person = {
  name: "John",
  age: 30,
  weight: 88.6
}

for (let property in person) {
  console.log(property)
  console.log(person.name)
}