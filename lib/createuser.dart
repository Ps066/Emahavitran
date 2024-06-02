import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emahavitran/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Createuser extends StatefulWidget {
  const Createuser({Key? key}) : super(key: key);

  @override
  State<Createuser> createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController consumerNoController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

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
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.blue[800],
                    // gradient: LinearGradient(colors: [(new  Color(0xff01579b)), new Color(0xff006064)],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                  ),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Image.asset(
                              "assets/images/logomaha.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 20),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Create User",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),



                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: userNameController,
                    cursorColor: Color(0xff006064),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blue[800],
                      ),
                      hintText: "Username",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   height: 54,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50),
                //     color: Color(0xffEEEEEE),
                //     boxShadow: [
                //       BoxShadow(
                //           offset: Offset(0, 20),
                //           blurRadius: 100,
                //           color: Color(0xffEEEEEE)
                //       ),
                //     ],
                //   ),
                //   child: TextField(
                //     cursorColor: Color(0xff006064),
                //     decoration: InputDecoration(
                //       focusColor: Color(0xff006064),
                //       icon: Icon(
                //         Icons.article_rounded,
                //         color: Color(0xff006064),
                //       ),
                //       hintText: "Consumer Number",
                //       enabledBorder: InputBorder.none,
                //       focusedBorder: InputBorder.none,
                //     ),
                //   ),
                // ),
                // consumer number input field
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: consumerNoController,
                    cursorColor: Color(0xff006064),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.article_rounded,
                        color: Colors.blue[800],
                      ),
                      hintText: "Consumer Number",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),

                // phone number input field
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: userPhoneController,
                    cursorColor: Color(0xff006064),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.blue[800],
                      ),
                      hintText: "Phone",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   height: 54,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50),
                //     color: Color(0xffEEEEEE),
                //     boxShadow: [
                //       BoxShadow(
                //           offset: Offset(0, 20),
                //           blurRadius: 100,
                //           color: Color(0xffEEEEEE)
                //       ),
                //     ],
                //   ),
                //   child: TextField(
                //     cursorColor: Color(0xff006064),
                //     decoration: InputDecoration(
                //       focusColor: Color(0xff006064),
                //       icon: Icon(
                //         Icons.phone,
                //         color: Color(0xff006064),
                //       ),
                //       hintText: "Phone Number",
                //       enabledBorder: InputBorder.none,
                //       focusedBorder: InputBorder.none,
                //     ),
                //   ),
                // ),


                GestureDetector(
                  onTap: () async {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => LoginScreen(),
                    //     )
                    // );
                    _getCurrentLocation().then((value) {
                      lat = '${value.latitude}';
                      long = '${value.longitude}';
                    });
                    var glink = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
                    print(glink);
                    print(lat);
                    print(long);
                    var username = userNameController.text.trim();
                    var consumerno = consumerNoController.text.trim();
                    var phoneno = userPhoneController.text.trim();
                    await FirebaseFirestore.instance.collection("All user").doc(currentUser!.uid).set({
                      'userId': currentUser!.uid,
                      'username': username,
                      'consumerNumber' : consumerno,
                      'phonenumber':phoneno,
                      'emailid': currentUser!.email,
                      'userLatitude': lat,
                      'userLongitude': long,
                      'positiononGoogleMap': glink,
                      'Created at': DateTime.now(),

                    },).then((value) => {
                      Fluttertoast.showToast(
                          msg: "User Info Updated Successfully!",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey[800],
                          textColor: Colors.white,
                          fontSize: 16.0
                      ),
                    });
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                    // print(currentUser!.uid);

                    // Write Click Listener Code Here.
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(colors: [(new  Color(0xff01579b)), new Color(0xff006064)],
                      //     begin: Alignment.centerLeft,
                      //     end: Alignment.centerRight
                      // ),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue[800],
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)
                        ),
                      ],
                    ),
                    child: Text(
                      "Create User",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 10, bottom: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text("Have Already Member?  "),
                //       GestureDetector(
                //         child: Text(
                //           "Login Now",
                //           style: TextStyle(
                //               color: Color(0xff006064)
                //           ),
                //         ),
                //         onTap: () {
                //           // Write Tap Code Here.
                //           Navigator.pop(context);
                //         },
                //       )
                //     ],
                //   ),
                // )
              ],
            )
        )
    );
  }

}
