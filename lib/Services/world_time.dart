import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDaytime; // true or false

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response =
        await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //  print(data);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(datetime);-=-=
    //print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

//convert time to string

    time = DateFormat.jm().format(now);
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    // print(now);
  }
}

// WorldTime instance =
//     WorldTime(location: 'Nigeria', flag: 'Nigeria.png', url: 'Africa/Nigeria');
  
