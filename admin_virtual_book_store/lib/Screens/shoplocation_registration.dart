import 'package:flutter/material.dart';
import 'package:admin_virtual_book_store/Components/passwordvisibilty.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:admin_virtual_book_store/Controller/main.dart';
class ShopLocation extends StatefulWidget {
  const ShopLocation({Key? key}) : super(key: key);

  @override
  _ShopLocationState createState() => _ShopLocationState();
}

class _ShopLocationState extends State<ShopLocation> {
   final _keyForm=GlobalKey<FormState>();
     final Map<String,String> time={};
     final nameController=TextEditingController();
   void validation(){
        Main.seller?.shopTime=time;
        Main.seller?.Shopname=nameController.text;
        print(Main.seller?.sendData());

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Registration")),
      body: SafeArea(
        child: Column(
          children: [
              Form(child: Column(children: [
                const Sizer(),
                TextFormField(
                    controller: nameController,
                    // validator: KPhoneNumberValidaor,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Shop Name",
                        prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.all(10),
                            child: Icon(Icons.phone)))),
                const Sizer(),
                ElevatedButton(
                  onPressed: () {
                    showTimeRangePicker(
                      context: context,
                      start: TimeOfDay(hour: 22, minute: 9),
                      onStartChange: (start) {
                        time["start"]=start.toString();
                        print("start time " + start.toString());
                      },
                      onEndChange: (end) {
                        time["end"]=end.toString();
                        print("end time " + end.toString());
                      },
                      interval: Duration(minutes: 30),
                      use24HourFormat: false,
                      padding: 30,
                      strokeWidth: 20,
                      handlerRadius: 14,
                      strokeColor: Colors.orange,
                      handlerColor: Colors.orange[700],
                      selectedColor: Colors.amber,
                      backgroundColor: Colors.black.withOpacity(0.3),
                      ticks: 12,
                      ticksColor: Colors.white,
                      snap: true,
                      labels: [
                        "12 pm",
                        "3 am",
                        "6 am",
                        "9 am",
                        "12 am",
                        "3 pm",
                        "6 pm",
                        "9 pm"
                      ].asMap().entries.map((e) {
                        return ClockLabel.fromIndex(
                            idx: e.key, length: 8, text: e.value);
                      }).toList(),
                      labelOffset: -30,
                      labelStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      timeTextStyle: TextStyle(
                          color: Colors.orange[700],
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      activeTimeTextStyle: TextStyle(
                          color: Colors.orange,
                          fontSize: 26,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    );
                  },
                  child: Text("Interval"),
                ),
                ElevatedButton(onPressed: validation, child: const Text("Submit"))
              ],))
          ],
        ),
      ),
    );
  }
}
