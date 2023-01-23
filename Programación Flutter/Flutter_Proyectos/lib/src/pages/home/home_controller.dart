import 'package:flutter/material.dart';
import 'package:flutter_proyectos/src/providers/auth_provider.dart';
import 'package:flutter_proyectos/src/utils/share_pref.dart';

class HomeController{

  BuildContext context;
  SharePref _sharePref;

  AuthProvider _authProvider;
  String _typeUser;

  Future init(BuildContext context) async {
    this.context = context;
    _sharePref = new SharePref();
    _authProvider = new AuthProvider();
    _typeUser = await _sharePref.read("typeUser");
    _authProvider.checkIfUserIsLogged(context,_typeUser);
    checkIfUserIsAuth();
  }

  void checkIfUserIsAuth(){
    bool isSigned = _authProvider.isSignedIn();
    if(isSigned){
      if(_typeUser == "client"){
        Navigator.pushNamedAndRemoveUntil(context, "client/map", (route) => false);
      }else{
        Navigator.pushNamedAndRemoveUntil(context, "driver/map", (route) => false);
      }
    }
  }

  void goToLoginPage(String typeUser){
    saveTypeUser(typeUser);
    Navigator.pushNamed(context, "login");
  }

  void saveTypeUser(String typeUser) async{
    await _sharePref.save('typeUser', typeUser);
  }


}