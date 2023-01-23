import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  final boxDecoration = const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5,0.5],
            colors: [
              Color(0xff5EE8C5),
              Color(0xff30BAD6)
            ]
          )
        );

  const ScrollScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDecoration, 
        child: PageView(
          scrollDirection: Axis.vertical,
          children: const [
            Page1(),
            Page2()
          ],
        ),
      )
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  const[
         Positioned(
          child: Backgroud(),
        ),
        MainConten()
      ],
    );
  }
}

class MainConten extends StatelessWidget {
  const MainConten({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle =  TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
          const Text('11°',style: textStyle,),
          const Text('Miercoles',style: textStyle,),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down,size: 100,color: Colors.white,)
        ],
      ),
    );
  }
}

class Backgroud extends StatelessWidget {
  const Backgroud({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover
        )
      ),
      
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          onPressed: (){},
          child: const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40),
            child:  Text('Bienvenido',style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff0087FA),
            shape: const StadiumBorder()
          ),
        ),
      ),
    );
  }
}