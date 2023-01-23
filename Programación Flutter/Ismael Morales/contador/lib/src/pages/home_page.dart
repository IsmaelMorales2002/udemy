import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final estioTexto = new TextStyle(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
          Text('Número de clicks', style: estioTexto,),
          Text('0',style: estioTexto,)
        ],),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print("Hola Mundo");
          },
          ),
    );
  }
}