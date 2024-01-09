import 'package:worldtime/services/world_time.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(site: 'Asia/Seoul', location: 'Seoul', flag: 'seoul.jpg'),
    WorldTime(site: 'Asia/Jakarta', location: 'Jakarata', flag: 'jakarta.jpg'),
    WorldTime(site: 'Asia/Hong_Kong', location: 'Hong-Kong', flag: 'hongkong.png'),
    WorldTime(site: 'Asia/Shanghai', location: 'Shanghai', flag: 'shanghai.jpg'),
    WorldTime(site: 'Asia/Tokyo', location: 'Tokyo', flag: 'tokyo.png'),
    WorldTime(site: 'Asia/Kuala_Lumpur', location: 'Kaula-Lampur', flag: 'kaula-lampur.png'),
    WorldTime(site: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png')
  ];

  Future<void> UpdateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[800],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Card(color: Colors.blue[900],
              child: ListTile(tileColor: Colors.blue[900],
                onTap: () {
                  UpdateTime(index);
                },
                title: Text(locations[index].location, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),

                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
