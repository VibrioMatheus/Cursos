const url = "http://localhost:5500/api"


//Fazendo GET com axios
function getUsers() {
  axios.get(url)
    .then(response => {
      apiResult.textContent = JSON.stringify(response.data) //transformando em texto simples
    })
    .catch(error => console.error(error))
}

getUsers()

//Fazendo POST (inserção) com axios
const newUser = {
  name: "Bruno e Marrone",
  avatar: "https://picsum.photos/200/300",
  city: "Rio de Janeiro"
}

function addUser(newUser) {
  axios.post(url, newUser)
    .then(response => {
      console.log(response)
    })
    .catch(error => console.error(error))
}

//addUser(newUser)

//Trazendo informações de um user especifico
function getUser(id) {
  axios.get(`${url}/${id}`)
    .then(response => {
      const data = response.data
      userName.textContent = data.name
      userCity.textContent = data.city
      userID.textContent = data.id
      userAvatar.src = data.avatar
    })
    .catch(error => console.error(error))
}

getUser(3)

//Editando dados com PUT 
const updatedUser = {
  name: "Gustavo Rimas",
  avatar: "https://picsum.photos/200/300",
  city: "Goiás"
}

function updateUser(id) {
  axios.put(`${url}/${id}`, updatedUser)
    .then(response => {
      console.log(response)
    })
    .catch(error => console.error(error))
}

//updateUser(3)

//Deletando com DELETE
function deleteUser(id) {
  axios.delete(`${url}/${id}`)
    .then(response => {
      console.log(response)
    })
    .catch(error => console.error(error))

}

deleteUser(3)