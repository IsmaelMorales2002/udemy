
let a = 10;

if(a >= 10){
    console.log('A es mayor o igual a 10');
}

//console.log('Fin de programa');

const hoy  = new Date();
let dia = hoy.getDay();

console.log({dia});

if(dia === 0){
    console.log('Domingo');
}else{
    console.log('No es domigno')
}