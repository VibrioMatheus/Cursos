//Var é global e local
console.log('> existe x antes do bloco? ', x) // undefined de retorno

{
  var x = 0
  console.log(x)
}

console.log('> existe x depois do bloco? ', x) // retorna o valor 0


//let e const são lcais e só funcionam no escopo onde foi criada

console.log('> existe y antes do bloco? ', y) // da erro, só consegue acessar dps da inicialização

{
  let y = 0

}

console.log('> existe y depois do bloco? ', y) // da erro, só existe dentro do bloco

