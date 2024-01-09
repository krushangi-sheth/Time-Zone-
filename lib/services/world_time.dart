import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime{
  late String location; //location name for the ui
  String time = '';     //time in that location
  String flag = '';     //url to an asset flag icon
  String site = '';     //location url for api endpoint
  late bool isDayTime ;      //true or false whether its daytime or not

  WorldTime({required this.location, required this.flag, required this.site});

  Future<void> getTime() async {

    try{
      //Make Request for api
      String url = 'https://worldtimeapi.org/api/timezone/$site';

      Response response = await get(Uri.parse(url));
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data like datetime and offset
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1,3);
      String offset2 = data['utc_offset'].substring(4,6);
      // print({datetime, offset2});

      //Create Datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      // print(now);

      //purpose:to set time property and converting to string(here;time) from object(here;now)
      time = DateFormat.jm().format(now);

      //bool value check
      isDayTime = now.hour> 6 && now.hour < 23 ? true : false ;

    }
    catch(e){
      print('caught error: $e');
      time = 'Could not fetch timezone';
    }
  }
}

