import 'package:flutter/material.dart';
import 'package:flutter_timezone/services/world_time.dart';
import 'package:flutter_timezone/services/world_timezones.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<String> timezones = [];
  int _selectedIndex;
  bool isLoading=true;

  List <int> selectedLocations=new List();


  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
  void getData() async {
    timezones = await WorldTimeZone().getTimeZones();
    setState(() {});
  }

  void updateTime(index) async{
    WorldTime instance = WorldTime(
        location: timezones[index].split('/')[1],
        flag: timezones[index],
        url: timezones[index]);
    await instance.getTime();
    
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTime
    });
    
  }

  @override
  void initState() {
    super.initState();
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Locations"),
          centerTitle: true,
          elevation: 0,
        ),
        body:

        Stack(
          children:[


            ListView.builder(
              itemCount: timezones.length,
              itemBuilder: (context, index) {


                return Card(
                  color: _selectedIndex != null && _selectedIndex == index
                      ? Colors.grey
                      : Colors.white,
                  child: InkWell(
                    onTap: () {

                      setState(() {
                        _onSelected(index);
                      });
                      updateTime(index);

                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: Text(timezones[index]),
                    ),
                  ),
                );
              }


              ),

            // Center(
            //   child: CircularProgressIndicator(),
            // ),
        ]


    )


    );
  }
}
