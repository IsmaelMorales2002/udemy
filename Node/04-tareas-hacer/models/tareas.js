require('colors');
const Tarea = require('./tarea')

class Tareas{

    _listado = {};

    get listadoArr(){
        const listado = [];
        Object.keys(this._listado).forEach(key =>{
            const tarea = this._listado[key];
            listado.push(tarea);
        });

        return listado;
    }

    constructor(){
        this._listado = {};
    }

    borrarTarea(id = ''){
        if(this._listado[id]){
            delete this._listado[id];
        }
    }

    cargarTareasFromArray(tareas = []){
        tareas.forEach(tarea =>{
            this._listado[tarea.id] = tarea;
        });
    }

    crearTarea(desc = '') {

        const tarea = new Tarea(desc);
        this._listado[tarea.id] = tarea;
    }

    listadoCompleto(){
        for(let i = 0; i < this.listadoArr.length;i++){
            if(this.listadoArr[i].completadoEn !== null){
                console.log(`${`${i+1}`.green} ${this.listadoArr[i].desc} :: ${'Completado'.green}`,);
            }else{
                console.log(`${`${i+1}`.green} ${this.listadoArr[i].desc} :: ${'Pendiente'.red}`,);
            }
        }
    }

    listarPendientesCompletadas(completadas = true){
        for(let i = 0; i < this.listadoArr.length;i++){
            if(completadas){
                if(this.listadoArr[i].completadoEn !== null) console.log(`${`${i+1}`.green} ${this.listadoArr[i].desc} :: ${'Completado'.green}`,);
            }else{
                if(this.listadoArr[i].completadoEn == null) console.log(`${`${i+1}`.green} ${this.listadoArr[i].desc} :: ${'Pendientes'.red}`,);
            }
        }
    }

     toggleCompletadas( ids = [] ) {

        ids.forEach(id =>{
            const tarea = this._listado[id];
            if(!tarea.completadoEn){
                tarea.compleadoEn = new Date().toISOString()
            }
        });

        this.listadoArr.forEach(tarea =>{

            if(!ids.includes(tarea.id)){
                this._listado[tarea.id].compleadoEn = null;
            }

        });
    }

}

module.exports = Tareas;