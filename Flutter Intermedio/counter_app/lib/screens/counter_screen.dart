import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

  int counter = 10;

 

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {

    const fonstSiza30 = TextStyle(fontSize: 30);
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
            const Text("Número de Clicks", style: fonstSiza30,),
            Text("$counter", style: fonstSiza30,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CustomFloaringButton(),
    );
  }
}

class CustomFloaringButton extends StatelessWidget {
  const CustomFloaringButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        FloatingActionButton(
          child:  Icon(Icons.plus_one_outlined),
          onPressed: null),

          FloatingActionButton(
          child:  Icon(Icons.backspace_rounded),
          onPressed:null),

          FloatingActionButton(
          child:  Icon(Icons.exposure_minus_1),
          onPressed: null ),
      ],
    );
  }
}