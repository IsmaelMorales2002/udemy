import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_proyectos/src/pages/driver/map/driver_map_controller.dart';
import 'package:flutter_proyectos/src/utils/colors.dart' as utils;
import 'package:flutter_proyectos/src/widgets/button_app.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverMapPage extends StatefulWidget {
  const DriverMapPage({Key key}) : super(key: key);

  @override
  _DriverMapPageState createState() => _DriverMapPageState();
}

class _DriverMapPageState extends State<DriverMapPage> {

  DriverMapController _con = new DriverMapController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      body: Stack(
        children: [
          _googleMapsWidget(),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buttonDrawer(),
                    _buttonCenterPosition()
                  ],
                ),
                Expanded(child: Container()),
                _buttonConnect()
              ],
            ),
          )
        ],
      )
    );
  }

  Widget _buttonCenterPosition(){
    return Container(
      alignment: Alignment.centerLeft,
      child: Card(
        shape: CircleBorder(),
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        elevation: 0.5,
        child: Container(
          padding: EdgeInsets.all(10),
            child: Icon(Icons.location_searching)),
      ),
    );
  }

  Widget _buttonDrawer(){
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: (){},
        icon: Icon(Icons.menu,color: Colors.white,),
      ),
    );
  }

  Widget _buttonConnect(){
    return Container(
      height: 50,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(horizontal: 60,vertical: 30),
      child:ButtonApp(
        text: "Conectarse",
        color: utils.Colors.ColorPrimario,
        textColor: Colors.white,
      ) ,
    );
  }

  Widget _googleMapsWidget(){
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _con.initialPosition,
        onMapCreated: _con.onMapCreate,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
    );
  }

}
