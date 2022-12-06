const { EventEmitter } = require('events')
const { inherits } = require('util')

const ev = new EventEmitter()

//Ouvindo eventos
ev.on('saySomething', (message) => {
  console.log('Te ouvi: ', message)
})

//Irá executar apenas o primeiro disparo que ele ouvir
ev.once('saySomething', (message) => {
  console.log('Te ouvi: ', message)
})

//Emitindo eventos
ev.emit('saySomething', "Mathias")
ev.emit('saySomething', "Pedro")

//Herdando EventEmitter para inherits
function Character(name) {
  this.name = name
}

inherits(Character, EventEmitter)

const chapolin = new Character("Chapolin")
chapolin.on('help', () => console.log(`Eu! o ${chapolin.name} colorado!`))

console.log('Oh! E agora, quem poderá me defender?')
chapolin.emit('help')