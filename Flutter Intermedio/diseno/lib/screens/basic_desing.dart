import 'package:flutter/material.dart';

class BasicDesingScreen extends StatelessWidget {
   
  const BasicDesingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [
          //Imagen
          const Image(image: AssetImage('assets/landscape.jpg')),

          //Titulo
          const Title(),

          //Button Section
          const ButtonSection(),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: const Text(' had a great weekend. On Friday afternoon, I finished work at 5 PM. I went home and took a shower. Then I went to see a couple of my friends at a bar downtown. We had a couple of beers and a nice talk. ')
            )
        ],
      )
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const[
              Text('Oeschinen Lake Campgroud',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.black26),)
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star,color: Colors.red,),
          const Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CostumButton(icon: Icons.call,texto: 'CALL',),
          CostumButton(icon: Icons.mail_outline_sharp,texto: 'Route',),
          CostumButton(icon: Icons.share,texto: 'Share',),
        ],
      ),
    );
  }
}

class CostumButton extends StatelessWidget {

  final IconData icon;
  final String texto;

  const CostumButton({
    Key? key, 
    required this.icon, 
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue,),
        Text(texto,style: const TextStyle(color: Colors.blue,fontSize: 15),),
      ],
    );
  }
}
