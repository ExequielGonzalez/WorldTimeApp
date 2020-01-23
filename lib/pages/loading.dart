import 'package:flutter/material.dart';
import 'package:hora_mundial/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String tiempo;

  Future<void> getWorldTime() async {
    WorldTime prueba = WorldTime(
        location: 'Argentina',
        url: 'America/Argentina/Buenos_Aires',
        flag: 'Argentina.png');
    await prueba.getTime();
    tiempo = prueba.time;
    print(tiempo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }
}
