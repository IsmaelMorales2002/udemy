import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


enum ServerStatus{
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{

  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;
  Function get emit => _socket.emit;

  SocketService(){
    _initCofing();
  }

  void _initCofing(){
      _socket = IO.io('https://flutter-socker-server-morales.herokuapp.com/',{
       'transports':['websocket'],
       'autoConnect' : true,
     });
    _socket.onConnect((_) {
      print('connect');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket.onDisconnect((_){
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    

    // socket.on('nuevo-mensaje',(payload){
    //   print('nuevo-mensaje: $payload');
    //   print('Nombre:' + payload['nombre']);
    //   print('Mensaje:' + payload['mensaje']);
    //   print(payload.containsKey('mensaje2')? payload['mensaje2']:'no hay');
    // });
  }

}