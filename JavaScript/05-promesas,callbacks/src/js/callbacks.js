const heroes = {
    capi:{
        nombre: 'Capitan América',
        poder: 'Aguantar inyecciones sin morir'
    },
    iron:{
        nombre: 'Ironman',
        poder: 'Absurda cantidad de dinero'
    },  
    spider:{
        nombre: 'Spiderman',
        poder: 'La mejor reaccion alergica a las picaduras de araña'
    }
}

export const buscarHeroe = (id,callback) =>{

    const heroe = heroes[id];

    callback(heroe);
}