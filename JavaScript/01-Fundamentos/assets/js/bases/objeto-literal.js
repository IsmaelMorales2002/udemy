let personaje = {
    nombre: 'Tony Stark',
    codeName: 'Ironman',
    vivo: false,
    edad: 40,
    coords: {
        lat: '34.034',
        lng: -118.70
    },
    trajes: ['Mark I','Mark V','Hulkbuster'],
    direccion: {
        zip: '10880, 80265',
        ubicacion: 'Malibu, California',
    },
    'ultima-pelicular': 'Infinity Wark'
};

console.log('Nombre',personaje.nombre);
console.log('Nombre',personaje['nombre']);
console.log('Edad',personaje.edad);

console.log('Coors',personaje.coords);
console.log('Lat',personaje.coords.lat);

console.log('No. Trajes',personaje.trajes.length);
console.log('Ultimo Traje',personaje.trajes[personaje.trajes.length-1]);

const x = 'vivo';
console.log('Vivo',personaje[x]);

console.log('Ultima pelicula',personaje["ultioma-pelicula"]);
 // Más detalles

 delete personaje.edad;
 console.log(personaje);

 personaje.casado = true;

 const entriesPares = Object.entries(personaje);
 console.log(entriesPares);

 //personaje = true;

 Object.freeze(personaje);

 personaje.direccion = 10000;
 personaje.direccion.ubicacion = 'Costa Rica';
 console.log(personaje);

 // listado en forma de arreglo
 const propiedades = Object.getOwnPropertyNames(personaje);
 const valores = Object.values(personaje);
 console.log({propiedades,valores});