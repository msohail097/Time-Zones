import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/datamodel.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  List<dynamic> listOfTimeZones = new List();
  List<String> Locations = new List();


  List <TimeModel> newList=new List();


  List<String> Times = new List();
  bool value=true;
  int i=0;
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;


    data.forEach((key, val) {
      listOfTimeZones.add(val);
    });

    final uniqueJsonList = listOfTimeZones.map((item) => jsonEncode(item)).toList();
    //final uniqueJsonList = listOfTimeZones.toSet().toList();









    for (int i=0;i<uniqueJsonList.length;i++) {
        Locations.add(uniqueJsonList[i]);

        try {
          do {
            Locations.add(uniqueJsonList[i + 4]);
            i = i + 4;
          } while (uniqueJsonList[i + 4] != null);
        } catch (Exception) {
          break;
        }
      }

      Locations = Locations.toSet().toList();

      for (int i = 0; i < uniqueJsonList.length; i++) {
        i = i + 2;
        Times.add(uniqueJsonList[i]);


        try {
          do {
            if (i == 2) {
              i = i + 3;
            }
            else {
              i = i + 4;
            }
            Times.add(uniqueJsonList[i]);
            //i=i+4;
          } while (uniqueJsonList[i] != null);
        } catch (Exception) {
          break;
        }


      }

      Times = Times.toSet().toList();



    print(data);

    // String bgImage =
    //     data['isDayTime'] ? "images/day.jpeg" : "images/night.jpeg";
    // Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[900];
     //Color textColor = data['isDayTime'] ? Colors.grey[900] : Colors.white,
    Color textColor =  Colors.grey[900];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child:
            
        Column(
          children: [


            Card(
              elevation: 5.0,
              shadowColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height*0.070,
                width: MediaQuery.of(context).size.width*1,
          //
                    child: FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                      await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'time': result['time'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime']
                        };
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0,10,0),
                      child: Icon(
                        Icons.edit_location,
                        color: Colors.black87,
                        size: 25.0,
                      ),
                    ),
                    label: Text(
                      "Click here to select location ",
                      style: TextStyle(color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),

                    )),
              ),
            ),


            SizedBox(height: 10.0,),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing:20,
                      mainAxisSpacing: 10),
                itemCount: Locations.length,
                itemBuilder: (BuildContext context, int index) {
                  i=i+1;
                  print (i);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8,5, 8, 5),
                    child: Card(
                        elevation: 15.0,
                      shadowColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                        child: Container(
                        height: 300,
                        width:500,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    //data['isDayTime' != null ?

                                value ==true?"images/day.jpeg" : "images/night.jpeg"),

                             //   AssetImage(bgImage),

                                fit: BoxFit.cover)

                        ),





                        child:

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    //data['location'],
                                    //uniqueJsonList[index],
                                    Locations[index],
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 20.0,
                                        letterSpacing: 2.0),
                                    overflow: TextOverflow.ellipsis,
                                          ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),

                            Text(
                             // data['time'],
                              //uniqueJsonList[index+2],


                              Times[index],
                              style: TextStyle(color: textColor, fontSize: 20.0),
                            ),
                          ],
                        ),
                    ),
                      ),
                  );
                }),
            ),
          ],
        ),
        ),
    );
  }





   findCommonCharacters(str, str2){

    Set<String> uniqueList={};
    for(int i=0;i<str.length;i++){
      if(str2.contains(str[i])){
        uniqueList.add(str[i]);
        print("val : ${str[i]}");
      }
    }
    return uniqueList;
  }


}


