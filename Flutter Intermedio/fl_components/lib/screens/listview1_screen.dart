import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
   
  const ListView1Screen({Key? key}) : super(key: key);

  final options = const["Call Of Duty","Free Fire","Forza Horizon","Warzon"];

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("ListView Tipo 1")
      ),
      body:  ListView(
        children:  [
          ...options.map(
            (game) =>  ListTile(
              title:  Text(game),
              trailing: const Icon(Icons.arrow_forward_ios),
            )
          ).toList()
        ],
      )
    );
  }
}