const questions = [
  'O que aprendi hoje?',
  'O que me deixou aborrecido?',
  'O que eu poderia fazer para melhorar?',
  'O que me deixou feliz hoje?',
  'Quantas pessoas ajudei hoje?',
]

const ask = (index = 0) => {
  process.stdout.write("\n\n" + questions[index] + " > ") // Processo de saida padrao do processo
}

ask()

//Assincronismo, ele esta esperando entrada de dados
const answers = []
process.stdin.on("data", data => {
  answers.push(data.toString().trim())
  if (answers.length < questions.length) {
    ask(answers.length)
  } else {

    process.exit()
  }

}) // todas vez q tiver dados vai rodar, deixando a gente digitar

process.on('exit', () => { //Fazer algo quando ouvir o exit
  console.log(answers)
})