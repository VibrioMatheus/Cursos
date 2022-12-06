const booksByCategory = [
  {
    category: "Riqueza",
    books: [
      {
        title: "Os segredos da mente milionária",
        author: "T. Harv Eker",
      },
      {
        title: "O homem mais rico da Babilônia",
        author: "George S. Clason",
      },
      {
        title: "Pai rico, pai pobre",
        author: "Robert T. Kiyosa e Sharon L. Lechter",
      },
    ],
  },
  {
    category: "Inteligência Emocional",
    books: [
      {
        title: "Voce é Insubstituível",
        author: "Augusto Cury",
      },
      {
        title: "Ansiedade - Como enfrentar o mal do século",
        author: "Augusto Cury",
      },
      {
        title: "Os 7 hábitos das pessoas altamente eficazes",
        author: "Stephen R. Covey",
      },
    ],
  },
];


//Função para contar o total de livros por categorias
function countBooksCategory() {
  let totalBooks

  for (let i = 0; i < booksByCategory.length; i++) {
    console.log(booksByCategory[i].category)
    totalBooks = 0
    for (let j = 0; j < booksByCategory[i].books.length; j++) {
      totalBooks++;
    }
    console.log(`Total de livros: ${totalBooks}`)
  }

}

//Função para contar o total de autores
function countAuthors() {
  let authors = []

  for (let i = 0; i < booksByCategory.length; i++) {
    for (let j = 0; j < booksByCategory[i].books.length; j++) {
      if (authors.indexOf(booksByCategory[i].books[j].author) == -1) {
        authors.push(booksByCategory[i].books[j].author)
      }
    }
  }
  console.log(`Total de autores: ${authors.length}`)
}

//Função para imprimir os livros do autor informado
function printBooks(name) {
  let count = 0
  if (name.length == 0) {
    throw new Error('Você precisa de informar um nome')
  }

  for (let i = 0; i < booksByCategory.length; i++) {
    for (let j = 0; j < booksByCategory[i].books.length; j++) {
      if (!booksByCategory[i].books[j].author.indexOf(name)) {
        console.log(booksByCategory[i].books[j].title)
        count++
      }
    }
  }
  if (count == 0) {
    console.log(`O autor ${name} não possui nenhum livro cadastrado`)
  }
}

try {
  printBooks('Mathias')
} catch (error) {
  console.log(error.message)
}

countAuthors()

countBooksCategory()



