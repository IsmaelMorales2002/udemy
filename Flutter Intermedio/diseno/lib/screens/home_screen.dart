import 'package:diseno/widgets/background.dart';
import 'package:diseno/widgets/card_table.dart';
import 'package:diseno/widgets/costum_button_navigator.dart';
import 'package:diseno/widgets/page_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: const [
          Backgroud(),
          _HomeBody()
        ],
      ),
      bottomNavigationBar:const CustomButtonNavigator(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const[
          //titulos
          PageTitleScreen(),
          CardTable()
          
        ],
      ),
    );
  }
}