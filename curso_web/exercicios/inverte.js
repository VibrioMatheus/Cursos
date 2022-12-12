
function invertType(value) {
  const type = typeof (value)
  if (type == "boolean") {
    return false
  } else if (type == "number") {
    if (value == 0)
      return 0
    else
      return value * -1
  } else
    return `O tipo esperado era Boolean ou Numbers, e vc informou ${type}`
}


console.log(invertType(-10))