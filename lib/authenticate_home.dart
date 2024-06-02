import 'package:emahavitran/login.dart';
import 'package:emahavitran/signup.dart';
import 'package:flutter/material.dart';
import 'package:emahavitran/maps.dart';

class Authhome extends StatefulWidget {
  const Authhome({Key? key}) : super(key: key);

  @override
  State<Authhome> createState() => _AuthhomeState();
}

class _AuthhomeState extends State<Authhome> {
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
                  ) ,
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Verify Your Account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )
                              ),
                              Icon(Icons.more_horiz),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),

                        Container(
                          child: Image.asset(
                            "assets/images/logomaha.png",
                            height: 320,
                            width: 320,
                          ),
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    )
                                );
                },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.orange[700],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: ListTile(
                                        leading: Icon(
                                          Icons.login,
                                          color: Colors.white,
                                        ),
                                        title: Text(
                                          'Log Into Your Account',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        )
                                    )
                                ),
                              ),
                            ),
                            Text(
                              'or',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 18,
                              ),
                            ),
                            InkWell(
                              onTap : (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    )
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green[700],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: ListTile(
                                        leading: Icon(
                                          Icons.verified_user,
                                          color: Colors.white,
                                        ),
                                        title: Text(
                                          'Register Your Account',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        )
                                    )
                                ),
                              ),
                            ),

                          ],
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
