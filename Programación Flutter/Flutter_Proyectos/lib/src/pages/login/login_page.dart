import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_proyectos/src//utils/colors.dart' as utils;
import 'package:flutter_proyectos/src/pages/login/login_controller.dart';
import 'package:flutter_proyectos/src/widgets/button_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();

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
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
            _textDontHaveAccount()
          ],
        ),
      ),
    );
  }

  Widget _textDontHaveAccount(){
    return GestureDetector(
      onTap: _con.goToRegisterPage,
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
            "¿No tienes cuenta?",
          style: TextStyle(
            fontSize: 17
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: ButtonApp(
        onPresserd: _con.login,
        text: "Iniciar Sesión",
        color: utils.Colors.ColorPrimario,
        textColor: Colors.white,
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
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
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
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
          "Inicia Sesión Para Continuar",
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
