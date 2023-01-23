import 'package:flutter/material.dart';
import 'package:flutter_proyectos/src/models/client.dart';
import 'package:flutter_proyectos/src/providers/auth_provider.dart';
import 'package:flutter_proyectos/src/providers/client_provider.dart';
import 'package:flutter_proyectos/src/utils/my_progress_dialog.dart';
import 'package:flutter_proyectos/src/utils/snackbar.dart' as utils;
import 'package:progress_dialog/progress_dialog.dart';


class ClientRegisterController{

  BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController usernamelController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  AuthProvider _authProvider;
  ClientProvider _clientProvider;
  ProgressDialog _progressDialog;

  Future init(BuildContext context){
    this.context = context;
    _authProvider = new AuthProvider();
    _clientProvider = new ClientProvider();
    _progressDialog = MyProgressDialog.createProgressDialog(context,"Espere un monento");
  }

  void register() async{
    String username = usernamelController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmpassword = confirmPasswordController.text.trim();

    print("Email: $email");
    print("Password: $password");

    if(username.isEmpty && email.isEmpty && password.isEmpty && confirmpassword.isEmpty){
      print("No dejar ningun campo vacio");
      utils.Snackbar.showSnackbar(context, key, "No Dejar ningun campo vacio");
      return;
    }

    if(confirmpassword != password){
      print("Las contraseñas no coinciden");
      utils.Snackbar.showSnackbar(context, key, "Las contraseñas no coinciden");
      return;
    }

    if(password.length < 6){
      print("La contraseña debe tener al menos 6 caracteres");
      utils.Snackbar.showSnackbar(context, key, "La contraseña debe tener al menos 6 caracteres");
      return;
    }

    _progressDialog.show();

    try{
     bool isRegister= await _authProvider.register(email, password);

     if(isRegister){
       Client client = new Client(
         id: _authProvider.getUser().uid,
         email: _authProvider.getUser().email,
         username: username,
         password: password
       );

       await _clientProvider.create(client);
       _progressDialog.hide();
       Navigator.pushNamedAndRemoveUntil(context, "client/map", (route) => false);
       utils.Snackbar.showSnackbar(context, key, "El Usuario se registro correctamente");
       print("El Usuario se registro correctamente");
     }else{
       _progressDialog.hide();
       print("El Usuario no se pudo registrar");
     }
    }catch(error){
      _progressDialog.hide();
      print("Error $error");
      utils.Snackbar.showSnackbar(context, key, "Error: $error");
    }

  }


}