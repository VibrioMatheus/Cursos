const express = require('express')
const app = express()

app.set("view engine", "ejs") // falando para o express que a ferramenta que vamos renderizar o html(view engine) é o ejs

//criando rota, por padrao ele ja esta dentro da pasta view
app.get("/", function (req, res) {
  const items = [
    {
      title: "D",
      message: "esenvolver aplicação"
    },
    {
      title: "E",
      message: "JS usa JavaScript para renderizar HTML"
    },
    {
      title: "M",
      message: "uito fácil de usar"
    },
    {
      title: "A",
      message: "melhor"
    },
    {
      title: "I",
      message: "nstall EJS"
    },
    {
      title: "S",
      message: "intaxe simples"
    },

  ]

  const subtitle = "Uma linguagem de modelagem para criação de páginas HTML utilizando JS"

  res.render("pages/index", {
    qualitys: items,
    subtitle: subtitle,
  })
})

//criando rota /sobre
app.get("/sobre", function (req, res) {
  res.render("pages/about")
})

app.listen(8080) //ouvindo uma porta
console.log("Rodando...")