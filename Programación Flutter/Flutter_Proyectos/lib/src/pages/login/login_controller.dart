import 'package:flutter/material.dart';
import 'package:flutter_proyectos/src/models/client.dart';
import 'package:flutter_proyectos/src/models/driver.dart';
import 'package:flutter_proyectos/src/providers/auth_provider.dart';
import 'package:flutter_proyectos/src/providers/client_provider.dart';
import 'package:flutter_proyectos/src/providers/driver_provider.dart';
import 'package:flutter_proyectos/src/utils/my_progress_dialog.dart';
import 'package:flutter_proyectos/src/utils/share_pref.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter_proyectos/src/utils/snackbar.dart' as utils;

class LoginController{

  BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  AuthProvider _authProvider;
  ProgressDialog _progressDialog;
  DriverProvider _driverProvider;
  ClientProvider _clientProvider;

  SharePref _sharePref;
  String _typeUser;

  Future init(BuildContext context) async{
    this.context = context;
    _authProvider = new AuthProvider();
    _driverProvider = new DriverProvider();
    _clientProvider = new ClientProvider();
    _progressDialog = _progressDialog = MyProgressDialog.createProgressDialog(context,"Espere un monento");
    _sharePref = new SharePref();
    _typeUser = await _sharePref.read("typeUser");

    print("========== TIPO DE USUARIO =======");
    print(_typeUser);
  }

  void goToRegisterPage(){
    if(_typeUser == 'client') {
      Navigator.pushNamed(context, "client/register");
    }else{
      Navigator.pushNamed(context, "driver/register");
    }
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print("Email: $email");
    print("Password: $password");

    _progressDialog.show();

    try{
     bool isLogin = await _authProvider.login(email, password);
     _progressDialog.hide();

     if(isLogin){
       print("El Usuario esta logeado");

       if(_typeUser == "client"){
         Client client = await _clientProvider.getById(_authProvider.getUser().uid);
         print("Client: $client");
         if(client != null){
           Navigator.pushNamedAndRemoveUntil(context, "client/map", (route) => false);
         }else{
           utils.Snackbar.showSnackbar(context, key, "El Usuario no es valido");
           await _authProvider.signOut();
         }
       }
       else if(_typeUser == "driver"){
         Driver driver = await _driverProvider.getById(_authProvider.getUser().uid);
         print("Driver: $driver");
         if(driver != null){
           Navigator.pushNamedAndRemoveUntil(context, "driver/map", (route) => false);
         }else{
           utils.Snackbar.showSnackbar(context, key, "El Usuario no es valido");
           await _authProvider.signOut();
         }
       }

     }else{
       utils.Snackbar.showSnackbar(context, key, "El Usuario no se pudo autenticar");
       print("El Usuario no se pudo autenticar");
     }
    }catch(error){
      _progressDialog.hide();
      print("Error $error");
    }

  }


}