import 'package:flutter/material.dart';
import 'package:worldtimeapp/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:worldtimeapp/pages/loading.dart';
//import '../Services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Africa', flag: 'Nigeria.png', url: 'Africa/Lagos');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

    // print(instance.time);
    // setState(() {
    //   time = instance.time!;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
