import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emahavitran/powerTheftAlert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:emahavitran/maps.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:location/location.dart';

class SosAlert extends StatefulWidget {
  const SosAlert({Key? key}) : super(key: key);

  @override
  State<SosAlert> createState() => _SosAlertState();
}

class _SosAlertState extends State<SosAlert> {

  LocationData? currentLocation;
  User? currentUser = FirebaseAuth.instance.currentUser;

  TextEditingController titel = TextEditingController();
  TextEditingController problem = TextEditingController();

  late String lat;
  late String long;

  Future<Position> _getCurrentLocation() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location service is disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location Permission are denied');

      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error('Location permission are permanently denied, we can not request the permission');
    }
    return await Geolocator.getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Palghar',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize:30,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                            'Just Now!',
                            style: TextStyle(
                              fontSize: 15,
                              color : Colors.blue[100],
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MapSample()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                    ),
                  ),


                ],

              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  ),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.all(25),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'SOS Alert',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                            ),
                            // Icon(Icons.more_horiz),
                          ],
                        ),


                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE)
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: titel,
                            cursorColor: Color(0xff006064),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.subject,
                                color: Colors.blue[800],
                              ),
                              hintText: "Title of Your Problem",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE)
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: problem,
                            maxLines: 3, //or null
                            cursorColor: Color(0xff006064),
                            decoration: InputDecoration(
                              isCollapsed: true,
                              alignLabelWithHint: true,
                              icon: Icon(
                                Icons.report_problem,
                                color: Colors.blue[800],
                              ),
                              hintText: "Explain the Problem here !",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),

                        ),
                      ),

                      InkWell(
                        onTap: () async {
                          _getCurrentLocation().then((value) {
                            lat = '${value.latitude}';
                            long = '${value.longitude}';
                          });
                          var glink = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
                          print(glink);
                          print(lat);
                          print(long);
                          var titletxt = titel.text.trim();
                          var problemtxt = problem.text.trim();
                          await FirebaseFirestore.instance.collection("SOS Alert").doc().set({
                            'userId': currentUser!.uid,
                            'Title': titletxt,
                            'Problem' : problemtxt,
                            'emailid': currentUser!.email,
                            'userLatitude': lat,
                            'userLongitude': long,
                            'positiononGoogleMap': glink,
                            'Created at': DateTime.now(),

                          },).then((value) => {
                            Fluttertoast.showToast(
                                msg: "SOS Updated Successfully!",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey[800],
                                textColor: Colors.white,
                                fontSize: 16.0
                            ),
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            alignment: Alignment.center,
                            // margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            height: 54,
                            decoration: BoxDecoration(
                              // gradient: LinearGradient(colors: [(new  Color(0xff01579b)), new Color(0xff006064)],
                              //     begin: Alignment.centerLeft,
                              //     end: Alignment.centerRight
                              // ),
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(50),
                              // color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 50,
                                    color: Color(0xffEEEEEE)
                                ),
                              ],
                            ),
                            child: Text(
                              "Report",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
