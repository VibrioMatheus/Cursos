const promessa = new Promise(function (resolve, reject) {
  return resolve('ok')
})

async function start() {
  try {
    const result = await promessa // espera a promessa pegando o resultado dela
    console.log(result)
  } catch (err) {
    console.log(err)
  } finally {
    console.log('rodar sempre')
  }

}

start()

//Usando função async para pegar dados do git (de maneira diferente)
async function start() {
  const response = await fetch('https://api.github.com/users/maykbrito')
  const user = await response.json() // transformando a resposta em json
  const reposResponse = await fetch(user.repos_url)
  const repos = await reposResponse.json()
  console.log(repos)
}

start()

