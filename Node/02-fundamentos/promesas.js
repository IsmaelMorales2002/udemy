const empleados = [
    {
        id: 1,
        nombre: 'Melisaa'
    },
    {
        id: 2,
        nombre: 'Abigail'
    },
    {
        id: 3,
        nombre: 'Eduardo'
    }

];

const salarios = [
    {
        id: 1,
        salario: 500
    },
    {
        id: 2,
        salario: 550
    }

];

const getEmpleado = (id,callback) =>{

    
    return new Promise((resolve, reject) =>{
        
        const empleado = empleados.find(e => e.id === id);
        
        (empleado)
            ? resolve(empleado)
            : reject(`No existe el empleado con id ${id}`)
    });
    
}

const getSalario = () =>{

    return new Promise((resolve, reject) =>{
        
        const salario = salarios.find(s => s.id === id);
        
        (salario)
            ? resolve(salario)
            : reject(`No existe el salario con id ${id}`)
    });

}

const id=2;

// getEmpleado(id)
//             .then(empleado => console.log(empleado))
//             .catch(err => console.log(err));

// getSalario(id).then(salario => console.log(salario))
// .catch(err => console.log(err));

getEmpleado(id)
    .then(empleado =>{
        nombre = empleado;
        return getSalario(id)
    })
    .then(salario=>console.log('El empleado:',nombre,'tiene un salario de:',salario))