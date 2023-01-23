let nombres = ['Ismael','Estefany'];
console.log({nombres});

// for(let i = 0; i < nombres.length;i++){
//     console.log(nombres[i]);
// }

nombres.forEach(nombre => {
    console.log("Su nombre es: "+nombre);
});