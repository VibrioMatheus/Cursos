// setTImeout vai rodar uma função depois de X milisegundos
const timeOut = 1000
const finished = () => console.log('feito!')

let timer = setTimeout(finished, timeOut) //funcao, tempo
console.log('Mostrar')

// clearTimeout vai cancelar um timeOut
clearTimeout(timer)

//setInterval irá rodar uma função N vezes depois de X milisegundos
const checking = () => console.log('checking!')
let interval = setInterval(checking, timeOut)

//ClearInterval irá cancelar um setInterval
setTimeout(() => clearInterval(interval), 3000) //depois de 3 segundos vai cancelar

