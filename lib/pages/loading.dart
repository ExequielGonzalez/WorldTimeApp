import 'package:flutter/material.dart';
import 'package:hora_mundial/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    // print(tiempo);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': prueba.location,
      'time': prueba.time,
      'flag': prueba.flag,
      'isDay': prueba.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.redAccent,
          size: 120.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }
}
