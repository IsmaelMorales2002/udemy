

import 'package:estados/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController{

  var existeUsuerio = false.obs;
  var usuario = new Usuario().obs;
  
  int get profesionesCount{
    return this.usuario.value.profesiones.length;
  }

  void cargarUsuario(Usuario pUsuario){
    this.existeUsuerio.value = true;
    this.usuario.value = pUsuario;
  }

  void cambiarEdad(int edad){
    this.usuario.update((val) { 
      val!.edad = edad;
    });
  }

  void agregrarProfesion(String profesion){
    this.usuario.update((val) {
      val!.profesiones = [...val.profesiones, profesion];
    });
  }

}