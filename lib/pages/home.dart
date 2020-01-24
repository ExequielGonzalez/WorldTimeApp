import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Map data = {};
  String backgroundPhoto;
  Color textColor;

  Widget build(BuildContext context) {
    data = ModalRoute.of(context)
        .settings
        .arguments; //En data se guardan los argumentos que vienen de 'loading'
    print(data);
    backgroundPhoto = data['isDay'] ? 'assets/day.jpg' : 'assets/night.jpg';
    textColor = data['isDay'] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: backgroundPhoto,
            image: AssetImage(backgroundPhoto),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
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
                  icon: Icon(
                    Icons.edit_location,
                    color: textColor,
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 120,
                    color: textColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
