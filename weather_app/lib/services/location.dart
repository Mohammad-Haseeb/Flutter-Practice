import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? longitude;


  Future<List<double>> getPostion() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

       try{

         return [numberRounding(position.longitude),numberRounding(position.latitude)];
       }catch(e){
         return [0,0];

         
       }

  }

 double numberRounding(double value){
    return double.parse(value.toStringAsFixed(2));

 }
}