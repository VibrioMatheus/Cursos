const url = "http://localhost:5500/api"

function getUsers() {
  fetch(url)
    .then(response => response.json())
    .then(data => renderApiResult.textContent = JSON.stringify(data))
    .catch(error => console.error(error))
}

function getUser(id) {
  fetch(`${url}/${id}`)
    .then(response => response.json())
    .then(data => {
      userName.textContent = data.name
      userCity.textContent = data.city
      userAvatar.src = data.avatar
    })
    .catch(error => console.error(error))
}

//Fazendo post com o fetch
const newUser = {
  name: "Olivia Zars",
  avatar: "https://picsum.photos/200/300",
  city: "Rio do Sul"
}

function addUser(newUser) {
  fetch(url, {
    method: "POST",
    body: JSON.stringify(newUser), // transformando em JSON
    headers: {
      "Content-type": "application/json; charset=UTF-8"
    }
  })
    .then(response => response.json())
    .then(data => alertApi.textContent = data)
    .catch(error => console.error(error))
}

//addUser(newUser)
getUsers()
getUser(2)

//Fazendo PUT (edição de dados) com fetch
const updatedUser = {
  name: "Marcelo Clovis",
  avatar: "https://picsum.photos/200/300",
  city: "Recife"
}

function updateUser(updatedUser, id) {
  fetch(`${url}/${id}`, {// Passando id que vamos editar
    method: "PUT",
    body: JSON.stringify(updatedUser), // transformando em JSON
    headers: {
      "Content-type": "application/json; charset=UTF-8"
    }
  })
    .then(response => response.json())
    .then(data => alertApi.textContent = data) // N usa stringfy pois retorna texto simples, nao um objeto
    .catch(error => console.error(error))
}

//updateUser(updatedUser, 8)

//Fazendo DELETE com fetch
function deleteUser(id) {
  fetch(`${url}/${id}`, {
    method: "DELETE",
    headers: {
      "Content-type": "application/json; charset=UTF-8"
    }
  })
    .then(response => response.json())
    .then(data => alertApi.textContent = data)
    .catch(error => console.error(error))
}

deleteUser(19)