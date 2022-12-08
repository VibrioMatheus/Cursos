//Funções aceitar qualquer tipo de dado como argumento
function imprimirDado(dado) {
  console.log('outras tarefas')
  console.log(dado)
}

imprimirDado(1)
imprimirDado('texto')
imprimirDado(function () { //callback aqui
  return 'Ola Mundo'
})