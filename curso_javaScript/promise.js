/*
A promessa de que algo irá acontecer, poderá dar certo ou errado
mas irá acontecer
*/

let aceitar = true

console.log('pedir uber')

const promessa = new Promise((resolve, reject) => {
  if (aceitar) {
    return resolve('pedido aceito')
  }
  return reject('pedido negado')

})

console.log('aguardando')

promessa.then(result => console.log(result)).catch(erro => console.log(erro)).finally(() => console.log('finalizada'))


//Pegar infos
fetch('https://api.github.com/users/maykbrito')
  .then(response => response.json())
  .then(data => fetch(data.repos_url))
  .then(res => res.json())
  .then(d => console.log(d))
  .catch(err => console.log(err))