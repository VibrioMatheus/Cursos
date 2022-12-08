import axios from "axios";

//Pegando por meio da url
axios.get('https://api.github.com/users/maykbrito')
  .then(res => {
    const user = response.data

    return axios.get(user.repos_url)
  })
  .then(repos => console.log(repos.data))
  .catch(error => console.log(error))

//Promessas em concorrência
Promise.all([  // Array de promessas, só entra no then quando todos rodar
  axios.get('https://api.github.com/users/maykbrito'),
  axios.get('https://api.github.com/users/maykbrito/repos')
])
  .then(responses => {
    console.log(responses[0].data.login)
    console.log(responses[1].data.length)
  })