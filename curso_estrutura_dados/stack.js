//Passo 1: Modelando
class Stack {
  constructor() {
    this.data = []
    this.top = -1
  }
  //Colocar valor
  push(value) {
    this.top++
    this.data[this.top] = value
    return this.data
  }

  //Deletando
  pop() {
    if (this.top < 0) return undefined
    const poppedTop = this.data[this.top]
    delete this.data[this.top]
    this.top--
    return poppedTop
  }

  //Pegando ultimo
  peek() {
    if (this.top >= 0)
      return this.data[this.top]
    else
      return undefined
  }
}

//Passo 2: Utilizando
const stack = new Stack()

//Adicionar Dados
stack.push('learning')
stack.push('data')
console.log(stack.push('structures'))

console.log(stack.peek())

//Remover
stack.pop() // remove o ultimo a entrar
