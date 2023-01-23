const regresaTrue = () =>{
    console.log('Regresa true');
    return true;
}

const regresaFalse = () =>{
    console.log('Regresa false');
    return false;
}

console.log('Not o la negacion');
console.log(true); //true
console.log(!true); // false
console.log(!false); // true


horaApertura = ([0,6].includes(dia) ? 9 : 11);