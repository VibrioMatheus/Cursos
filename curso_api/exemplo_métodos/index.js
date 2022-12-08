const express = require('express') // chamando o módulo

const app = express()

let author = "Mathias"

app.listen('3000') //ouvindo o navegador na porta 3000

//Método GET, para pegarmos informações
//app.route('/').get((resq, res) => res.send(author))//resposta é hello
app.route('/sobre').get((resq, res) => res.send("hello sobre"))

//Middleware, ponte para falar que é json e ser transformado
app.use(express.json())

//Método POST, usando Insonia para testar, usamos para colocar informações
app.route('/').post((req, res) => res.send(req.body))

//Método PUT, editar informações
app.route('/').put((req, res) => {
  author = req.body.author //vai pegar só o q esta dentro da chave author
  res.send(author)
})

//Método DELETE, deletar informações
app.route('/:identificador').delete((req, res) => { // passando uma variável na rota como parametro
  author = ""
  res.send(req.params.identificador)
})

//PUT, PATCH e PUT para pegar informações do BODY

//Colocando variável na rota para podermos utilizar
app.route('/:nome').get((req, res) => res.send(req.params.nome))

//Usando query params, cria a variável na url
app.route('/').get((req, res) => res.send(req.query))