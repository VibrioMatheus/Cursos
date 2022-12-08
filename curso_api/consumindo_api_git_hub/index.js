const { default: axios } = require('axios')
const express = require('express')

const app = express()

app.listen('3000')

app.route('/').get((req, res) => {
  //Usando axios para retornar as infos da requisição
  axios.get('https://api.github.com/users/jakeliny')
    .then(result => res.send(`<img src="${result.data.avatar_url}" />`)) // data trás os dados
    .catch(error => console.log(error))
})