import 'dart:io';

import 'package:bandnamesapp/models/band.dart';
import 'package:bandnamesapp/services/socket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bans = [
    // Band(id: '1',name: 'Metalica',votes: 5),
    // Band(id: '2',name: 'Akash',votes: 1),
    // Band(id: '3',name: 'Pablo Olivares',votes: 2),
    // Band(id: '4',name: 'Queen',votes: 5),
  ];

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context,listen: false);

    socketService.socket.on('active-bands',_handleActiveBands);
    super.initState();
  }

  _handleActiveBands(dynamic payload){
     bans = (payload as List)
      .map((band) => Band.fromMap(band))
      .toList();

      setState(() {});
  }

  @override
  void dispose() {
    final socketService = Provider.of<SocketService>(context,listen: false);
    socketService.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BandNames',style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: socketService.serverStatus == ServerStatus.Online
              ? Icon(Icons.check_circle,color: Colors.blue[300],)
              : const Icon(Icons.offline_bolt,color: Colors.red,),
          )
        ],
      ),
      body: Column(
        children: [
          (bans.isNotEmpty)
              ? _showGraph()
              : const Text(
                  'No hay bandas',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
           Expanded(
             child: ListView.builder(
                itemCount: bans.length,
                itemBuilder: (context, i) => _bandTile(bans[i]
              )
                     ),
           ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand,
      ),
   );
  }

  Widget _bandTile(Band band) {

    final socketService = Provider.of<SocketService>(context,listen: false);

    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => socketService.emit('delete-band',{'id' : band.id}),
      background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerLeft,
          child:  Text('Delete Band',style: TextStyle(color: Colors.white),),
        )
      ),
      child: ListTile(
            leading: CircleAvatar(
              child: Text(band.name.substring(0,2)),
              backgroundColor: Colors.blue[100],
            ),
            title: Text(band.name),
            trailing: Text('${band.votes}',style: const TextStyle(fontSize: 20),),
            onTap: () => socketService.socket.emit('vote-band',{'id': band.id})
          ),
    );
  }

  addNewBand(){

    final textController = TextEditingController();

    if(Platform.isAndroid){
      //Android
      return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('New band name:'),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
              child: const Text('Add'),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: () => addBandToList(textController.text)
            )
          ],
        );
      },
    );
    }
    
    showCupertinoDialog(
      context: context, 
      builder: (_){
        return CupertinoAlertDialog(
          title: const Text('New band name:'),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Add'),
              onPressed: () => addBandToList(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Dismiss'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      }
    );

  }


  void addBandToList(String name){

    if(name.length > 1){
      final socketService = Provider.of<SocketService>(context,listen: false);
      // Podemos Agregrar
      socketService.emit('add-band',{
        'name' : name
      });
    }

    Navigator.pop(context);

  }

  // Mostrar grafica
  Widget _showGraph(){
    Map<String, double> dataMap = {};

        bans.forEach((band) { 
          dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
        });

    final List<Color> colorList = [
      Colors.blue[50] as Color, //<= agregar as Color
      Colors.blue[200] as Color,
      Colors.pink[50] as Color,
      Colors.pink[200] as Color,
      Colors.yellow[50] as Color,
      Colors.yellow[200] as Color,
    ];
      return Container(
        padding: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 200,
        child: PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          colorList: colorList,
          chartType: ChartType.ring,
        )
     
        
      );
   }

}