import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/widgets/scans_title.dart';

class MapasScreen extends StatelessWidget {
   
  const MapasScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const ScansTitle(tipo: 'geo');
  }
}