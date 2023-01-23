import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
   HomePageTemp({Key? key}) : super(key: key);

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(children: [
        _creacionItems()
      ],)
      );
  }

  List<Widget> _creacionItems(){
    
    List<Widget> lista = List<Widget>();
     for (String item in opciones) {
       final tempWidget = ListTile(
         title:Text(item),
       );

       lista..add(item)
       ..add(Divider());
     }

    return lista;
  }

}