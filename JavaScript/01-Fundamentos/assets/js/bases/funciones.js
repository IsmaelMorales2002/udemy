function saludar(nombre){
    console.log(arguments);
    console.log('Hola '+nombre);
    return 1;
}

const saludar2 = function(nombre){
    console.log('Hola ' + nombre);
}

const saludarFlecha = () =>{
    console.log('Hola Flecha');
}
const saludarFlecha2 = (nombre) =>{
    console.log('Hola ' + nombre);
}

const retornoDeSaludar = saludar('Ismael',19,false,'El Salvador');
console.log({retornoDeSaludar});
// saludar2('Morales');

// saludarFlecha();
// saludarFlecha2('Rocio');

function sumar(a,b){
    return a +b;
}

// const sumar2 = () =>{
//     return a + b;
// }

const sumar2 = (a,b) => a + b;



console.log(sumar2(1,2));
