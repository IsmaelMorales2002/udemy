import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier{

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebasesToken = 'AIzaSyCnarbjUeFqnwsY0V29dIkZ0MGjYF67LAE';

  final storage = new FlutterSecureStorage();


  //Si retornamos algo , es un error, si no , todo bien
  Future<String?> createUser(String email, String password) async{
    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp',{
      'key': _firebasesToken
    });

    final resp = await http.post(url,body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);

    if(decodeResp.containsKey('idToken')){
      //Token hay que guardarlo en un lugar seguro
      // decodeResp['idToken']
      return null;
    }else{
      return decodeResp['error']['message'];
    }

  }

  Future<String?> login(String email, String password) async{
    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',{
      'key': _firebasesToken
    });

    final resp = await http.post(url,body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);

    if(decodeResp.containsKey('idToken')){
      //Token hay que guardarlo en un lugar seguro
      // decodeResp['idToken']
      return null;
    }else{
      return decodeResp['error']['message'];
    }

  }

}