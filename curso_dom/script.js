//getElementById()
const element = document.getElementById('blog-title') // pega o h1 completo

//getElementByClassName()
const element2 = document.getElementsByClassName('') //trazendo elementos com a classe informada

//getElementsByTagName()
const element3 = document.getElementsByTagName('') //trazendo elementos com a tag informada

//querySelector()
//const element4 = document.querySelector('')//trazendo por tag css o primeiro que ele achar, por exemplo .blog-title

//querySelectorAll()
const element5 = document.querySelectorAll('[src]') // traz todos que vc passar a tag, retorna nodelist, vc pode usar foreach

//Manipulando conteúdo com textContent colocando conteudo
const element6 = document.querySelector('h1')
element6.textContent = "Ola Devs!"

//innerText, troca o texto interno
const element7 = document.querySelector('h1')
element7.innerText = "Ola Devs"

//innerHTML, adiciona html caso queira
const element8 = document.querySelector('h1')
element8.innerHTML = "Ola Devs <small>!!!</small>"

//Manipular valor de um input
const element9 = document.querySelector('input')
element9.value = "Valor que eu quiser"
console.log(element.value) // pegar valor do input caso tenha

//Manipular atributos dos elementos
const header = document.querySelector('header')
header.setAttribute('id', 'header') // modificando o atributo id do header para header
header.getAttribute('id')
header.removeAttribute('id')

//Alterando estilos
const element10 = document.querySelector('body')
element10.classList.add('active', 'green') //deixa a classe ativa
element10.classList.remove('active') // remove o ativo da classe
element10.classList.toggle('active') // liga ou desliga, se tiver ligado desliga e vice versa

//Navegando pelos elementos pais
const body = document.querySelector('body')
body.parentNode //pega o nó pai que no caso é o html

//Navegando pelos elementos filhos
const el = document.querySelector('body')

el.childNodes // pega todos os filhos em formato de NodeList
el.firstElementChild // não leva em conta espaços vazios e trás o primeiro filho
console.log(el.lastElementChild) // trás o ultimo filho

//Criando e adicionando elementos
const div = document.createElement('div') // criando a constante div que cria uma div
div.innerText = "Ola Devs!"

const body2 = document.querySelector('body')
const script = body.querySelector('script')
body2.append(div) //adiciona no final essa div
body2.prepend(div) // adiciona no começo a div
body2.insertBefore(div, script) // quer adicionar a div e antes da tag script
body2.insertBefore(div, script.nextSibling) // quer adicionar a div e depois da tag script

//Eventos, colocar on na tag
function print() {
  console.log('print')
}

const h1 = body2.querySelector('h1')
h1.addEventListener('click', print) //Ouvidor de eventos, qndo clicar vai printar, e serve para colocar dois eventos na msma tag

//Eventos de teclado
const input = document.querySelector('input')

input.onkeydown = function () { // a cada carecter printa
  console.log('rodei')
}

//Argumento event
input.onkeypress = function (event) {
  console.log(event) // pega o q ta sendo digitado
}









