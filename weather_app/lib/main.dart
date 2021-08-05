import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'services/location.dart';

const key ='10&appid=9a38e288fca05574a51a17ab11b484a8';
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      title: "Weather",

    ),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void gettLocation() async{

   final location=await Location().getPostion();
   print("Location ${location}");
      print(location[0]);
      print(location[1]);

   final response=await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/find?lat=${location[1]}&lon=${location[0]}&cnt=$key&units=metric'));
                if (response.statusCode==200){
                print("API RESPONSE ${response.body}");
              }

  }
  void initState()  {
    super.initState();
    gettLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.grey,
            size: 70.0,
          ),
        ),
      ),
    );
  }
}
