import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //funciones asincronas
  void getData() async {
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'lucun';
    });

    String pass = await Future.delayed(Duration(seconds: 2), () {
      return '154652981';
    });

    print('username: $username - password: $pass');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('empezando');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text('choose location screen'),
    );
  }
}
