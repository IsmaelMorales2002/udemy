import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_proyectos/src//pages/home/home_controller.dart';
import 'package:flutter_proyectos/src//utils/colors.dart' as utils;

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _con = new HomeController();

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
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: utils.Colors.ColorPrimario,
          child: Column(
            children: [
              _bannerApp(context),
              SizedBox(height: 50,),
              _textSelectYourRol(),
              SizedBox(height: 30,),
              _imageTypeUser(context,"assets/img/pasajera.png","client"),
              SizedBox(height: 10,),
              _textTypeUser("Pasajera"),
              SizedBox(height: 30,),
              _imageTypeUser(context,"assets/img/conductora.png","driver"),
              SizedBox(height: 10,),
              _textTypeUser("Conductora")
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerApp(BuildContext context){
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height*0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/img/logo_negro.png",
              width: 200,
              height: 200,
            ),
            Text(
                "Seguro y Rapido",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "vogue",
                fontSize: 22
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textSelectYourRol(){
    return Text(
      "SELECCIONA TU ROL",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  Widget _imageTypeUser(BuildContext context,String image,String typeUser){
    return GestureDetector(
      onTap: ()=> _con.goToLoginPage(typeUser),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 50,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _textTypeUser(String typeUser){
    return Text(
      typeUser,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20
      ),
    );
  }
}
