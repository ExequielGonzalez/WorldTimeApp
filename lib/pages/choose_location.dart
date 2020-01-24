import 'package:flutter/material.dart';
import 'package:hora_mundial/services/world_time.dart';
import 'package:hora_mundial/pages/loading.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'America/Argentina/Buenos_Aires',
        location: 'Buenos Aires',
        flag: 'Argentina.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  Future<void> getTimeUpdate(index) async {
    WorldTime info = locations[index];
    await info.getTime();

    Navigator.pop(context, {
      'location': info.location,
      'time': info.time,
      'flag': info.flag,
      'isDay': info.isDay,
    });

    //   Navigator.pushReplacementNamed(context, '/home', arguments: {
    //     'location': info.location,
    //     'time': info.time,
    //     'flag': info.flag,
    //     'isDay': info.isDay,
    //   });
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
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(4, 1, 4, 1),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                  getTimeUpdate(index);
                },
                title: Center(child: Text(locations[index].location)),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
