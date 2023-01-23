import 'package:flutter/material.dart';

class CustomButtonNavigator extends StatelessWidget {
  const CustomButtonNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      items: const [
        BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Calendario'),

        BottomNavigationBarItem(
        icon: Icon(Icons.pie_chart_outline_outlined),
        label: 'Grafica'),
        
        BottomNavigationBarItem(
        icon: Icon(Icons.supervised_user_circle),
        label: 'Usuarios'),
      ]
    );
  }
}