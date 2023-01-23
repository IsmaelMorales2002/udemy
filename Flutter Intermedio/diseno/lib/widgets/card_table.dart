import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SigleCard(color: Colors.blue,icon: Icons.border_all,text: 'General',),
            _SigleCard(color: Colors.pinkAccent,icon: Icons.car_rental,text: 'Transport',),
          ]
        ),
        TableRow(
          children: [
            _SigleCard(color: Colors.cyan,icon: Icons.shop,text: 'Shopping',),
            _SigleCard(color: Colors.red,icon: Icons.music_note,text: 'Bill',),
          ]
        ),
        TableRow(
          children: [
            _SigleCard(color: Colors.purpleAccent,icon: Icons.movie,text: 'Entretainment',),
            _SigleCard(color: Colors.redAccent,icon: Icons.restaurant_sharp,text: 'Grocery',),
          ]
        )
      ],
    );
  }
}

class _SigleCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;

  const _SigleCard({
    Key? key, 
    required this.icon, 
    required this.color, 
    required this.text
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackgroud(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon,size: 35,color: Colors.white,),
          radius: 30,
        ),
          const SizedBox(height: 10,),
          Text(text,style:  TextStyle(color: color,fontSize: 18),)
        ],
      )
    );
  }
}

class _CardBackgroud extends StatelessWidget {

  final Widget child;

  const _CardBackgroud({
    Key? key, 
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}