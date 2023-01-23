import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_proyectos/src//utils/colors.dart' as utils;
import 'package:flutter_proyectos/src/pages/login/login_controller.dart';
import 'package:flutter_proyectos/src/pages/client/register/client_register_controller.dart';
import 'package:flutter_proyectos/src/widgets/button_app.dart';

class ClientRegisterPage extends StatefulWidget {
  const ClientRegisterPage({Key key}) : super(key: key);

  @override
  _ClientRegisterPageState createState() => _ClientRegisterPageState();
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {

  ClientRegisterController _con = new ClientRegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("INIT STATE");

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    print("METODO BUILD");

    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _textDescripcion(),
            _textFieldUsername(),
            _textFieldEmail(),
            _textFieldPassword(),
            _textFieldConfirmPassword(),
            _buttonRegister(),
          ],
        ),
      ),
    );
  }

  Widget _textFieldConfirmPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: TextField(
        obscureText: true,
        controller: _con.confirmPasswordController,
        decoration: InputDecoration(
            labelText: "Confirmar Contraseña",
            suffixIcon: Icon(
              Icons.lock,
              color: utils.Colors.ColorPrimario,
            )
        ),
      ),
    );
  }

  Widget _textFieldUsername(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: TextField(
        controller: _con.usernamelController,
        decoration: InputDecoration(
            labelText: "Nombre Completo",
            suffixIcon: Icon(
              Icons.person,
              color: utils.Colors.ColorPrimario,
            )
        ),
      ),
    );
  }


  Widget _buttonRegister(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: ButtonApp(
        onPresserd: _con.register,
        text: "Registrarse Ahora",
        color: utils.Colors.ColorPrimario,
        textColor: Colors.white,
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            labelText: "Contraseña",
            suffixIcon: Icon(
              Icons.lock,
              color: utils.Colors.ColorPrimario,
            )
        ),
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: TextField(
        controller: _con.emailController,
        decoration: InputDecoration(
          labelText: "Correo Electronico",
          suffixIcon: Icon(
            Icons.email_rounded,
            color: utils.Colors.ColorPrimario,
          )
        ),
      ),
    );
  }

  Widget _textDescripcion(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text(
          "Registrate Para Continuar",
        style:  TextStyle(
          fontSize: 20
        ),
      ),
    );
  }
  
  Widget _bannerApp(){
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        color: utils.Colors.ColorPrimario,
        height: MediaQuery.of(context).size.height*0.22,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/img/logo_blanco.png",
              width: 200,
              height: 200,
            ),
            Text(
              "Seguro y Rapido",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "vogue",
                  fontSize: 22
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
