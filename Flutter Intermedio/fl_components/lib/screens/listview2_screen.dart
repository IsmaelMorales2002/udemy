import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
   
  const ListView2Screen({Key? key}) : super(key: key);

  final options = const["Call Of Duty","Free Fire","Forza Horizon","Warzon"];

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("ListView Tipo 2"),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body:  ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(Icons.arrow_forward_ios,color: Colors.indigo,),
          onTap: (){

          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: options.length)
    );
  }
}