//Passo 1: Modelando
class Queue {
  constructor() {
    this.data = []
  }

  //Adicionar um elemento ao final da fila
  enqueue(item) {
    this.data.push(item)
    console.log(`${item} chegou na fila!`)
  }

  //Remover o primeiro elemento a entrar na fila
  dequeue() {
    const item = this.data.shift()
    console.log(`${item} saiu da fila!`)
  }
}

//Passo 2: Utilizando
const fila = new Queue()

fila.enqueue('Mariana')
fila.enqueue('Joao')
fila.dequeue('Mariana')