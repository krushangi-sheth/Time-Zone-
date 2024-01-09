import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //will recieve sent data from loading to home via route
    data = data.isNotEmpty? data :ModalRoute.of(context)!.settings.arguments as Map;
    //'as map' refers to type in which we want retrieve data
    print(data);

    //setting bsckground image using bool
    String bgImagee = data['isDayTime']? 'day.jpg' : 'night.jpg';

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImagee'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                   dynamic result =  await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data ={
                       'time': result['time'],
                       'location': result['location'],
                       'isDayTime': result['isDayTime'],
                       'flag': result['flag'],
                     };
                   });
                  },
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 26,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['time'],
                      style: TextStyle(
                        color: Colors.grey[350],
                        fontSize: 66,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
