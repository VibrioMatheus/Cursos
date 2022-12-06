const btn = document.querySelector('#openModal')
const esc = document.querySelector('#esc')
console.log(btn)

btn.onclick = function () {

  esc.classList.remove('invisible')
}

document.addEventListener('keydown', function (event) {
  const isEscKey = event.key === 'Escape'

  if (isEscKey) {
    esc.classList.add('invisible')
  }
})



