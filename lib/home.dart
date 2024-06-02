import 'package:emahavitran/authenticate_home.dart';
import 'package:emahavitran/complaintchat.dart';
import 'package:emahavitran/maps.dart';
import 'package:emahavitran/powerTheftAlert.dart';
import 'package:emahavitran/sosAlert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// void main() => runApp(Home());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Authhome()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(items:[
      //   BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
      //   BottomNavigationBarItem(icon: Icon(Icons.help),label: ''),
      //   BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
      // ]),
      backgroundColor: Colors.blue[800],
        body : SafeArea(
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
                                'Services',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                              ),
                              Icon(Icons.more_horiz),
                            ],
                          ),


                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Basic()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:80 ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[700],
                                  borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                leading: Icon(
                                    Icons.help_center,
                                color: Colors.white,
                                ),
                                title: Text(
                                    "Complaint Helpline",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                       // Padding(
                       //   padding: const EdgeInsets.only(top: 10),
                       //   child: Container(
                       //     decoration: BoxDecoration(
                       //       color: Colors.blue[700],
                       //       borderRadius: BorderRadius.circular(16),
                       //     ),
                       //     child: ListTile(
                       //       leading: Icon(Icons.calculate,
                       //       color: Colors.white,),
                       //       title: Text("Bill Management System",
                       //         style: TextStyle(
                       //           color: Colors.white,
                       //           fontWeight: FontWeight.bold,
                       //
                       //         ),),
                       //     ),
                       //   ),
                       // ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MapSample()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                leading: Icon(Icons.map,
                                  color: Colors.white,),
                                title: Text("Your Locality Map",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Powertheftalert()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                leading: Icon(Icons.electric_bolt,
                                  color: Colors.white,),
                                title: Text("Power Theft Alerts",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SosAlert()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                leading: Icon(Icons.sos,
                                  color: Colors.white,),
                                title: Text("SOS Alert",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),),
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top:10 ),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.blue[700],
                        //       borderRadius: BorderRadius.circular(16),
                        //     ),
                        //     child: ListTile(
                        //       leading: Icon(
                        //         Icons.help_center,
                        //         color: Colors.white,
                        //       ),
                        //       title: Text(
                        //         "Contact Coustmer Service",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold,
                        //
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        InkWell(
                          onTap: (){
                            _signOut();
                            Fluttertoast.showToast(
                                msg: "Logged out Successfully!",
                                toastLength: Toast.LENGTH_LONG,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey[800],
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                leading: Icon(Icons.logout,
                                  color: Colors.white,),
                                title: Text("Logout",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),),
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
        )
    );
  }
}
