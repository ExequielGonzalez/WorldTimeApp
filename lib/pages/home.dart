import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Map data = {};

  Widget build(BuildContext context) {
    data = ModalRoute.of(context)
        .settings
        .arguments; //En data se guardan los argumentos que vienen de 'loading'
    print(data);
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit location'),
              ),
              SizedBox(height: 20),
              Text(
                data['location'],
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 120,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
