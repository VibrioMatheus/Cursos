import React, { useState, useEffect } from 'react'
import './style.css'

import { Card } from '../../components/Card'

export function Home() {
  const [studentName, setStudentName] = useState() //NomeEstado, Função Que atualiza estado
  const [students, setStudens] = useState([]) //Criando uma lista de estudantes
  const [user, setUser] = useState({ name: '', avatar: '' })

  function addStudent() {
    const newStudent = {
      name: studentName,
      time: new Date().toLocaleTimeString("pt-br", {
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
      })
    };

    //3 pontinhos pra ficar todos no mesmo vetor
    setStudens(prevState => [...prevState, newStudent]) //Novo vetor com o q tinha antes e o novo que estamos inserindo
  }

  useEffect(() => {
    //Corpo do useEffect (é chamado sempre que a interface é chamada)
    async function fetchData() {
      const response = await fetch('https://api.github.com/users/vibriomatheus')
      const data = await response.json()
      setUser({
        name: data.name,
        avatar: data.avatar_url
      })
    }
    fetchData()
  }, []) //Array serve para colocarmos um estado q o Effect é dependente

  return (
    <div className="container">
      <header>
        <nav>
          <div >
            <img id="logo" src="https://picsum.photos/60/60" alt="Logo" />
          </div>
          <div id="navs">
            <ul>
              <li>Inicio</li>
              <li>Sobre</li>
              <li>Serviços</li>
            </ul>
          </div>
          <div>
            <button id="btnContato">Fale Comigo</button>
          </div>

        </nav>
      </header>

      <main>
        <h1>Lista de Presença</h1>
        <div>
          <strong>{user.name}</strong>
          <img src={user.avatar} alt="Foto de perfil" />
        </div>
      </main>
      <input
        type="text"
        placeholder="Digite o nome..."
        onChange={e => setStudentName(e.target.value)} // Atualizando o estado do studentName por meio da função
      />
      <button type="button" id="btnAdc" onClick={addStudent}>
        Adicionar
      </button>

      {
        students.map(student => (
          < Card
            key={student.time} // Nunca pode ser repetido
            name={student.name}
            time={student.time}
          />
        )) //Cada elemento será armazenado em student
      }
    </div>

  )
}


