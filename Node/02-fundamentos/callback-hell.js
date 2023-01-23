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

    const empleado = empleados.find(e => e.id === id);
    
    if(empleado){
        callback(null,empleado)
    }else{
       callback(`Empleado con id ${id} no existe`);
    }


}

const getSalario = (id , callback) =>{

    const salario = salarios.find(e => e.id === id)?.salario;

    if(salario){
        callback(null,salario);
    }else{
        callback(`Salario con id ${id} no existe`);
    }

}

const id = 1;

getSalario(id,(err,salario) =>{

    if(err){
        console.log('ERROR!');
        return console.log(err);
    }else{
        console.log('Salario si existe!');
        console.log(salario);
    }

})

getEmpleado(id,(err,empleado) =>{

    if(err){
        console.log('ERROR!');
        return console.log(err);
    }

    console.log('Empleado existe!');
    console.log(empleado.nombre);
});

