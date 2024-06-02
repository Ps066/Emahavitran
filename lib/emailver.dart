import 'package:emahavitran/createuser.dart';
import 'package:flutter/material.dart';

class EmailVerify extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<EmailVerify> {
  @override
  Widget build(BuildContext context) => initWidget();
  static const IconData article_rounded = IconData(0xf580, fontFamily: 'MaterialIcons');
  Widget initWidget() {
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
                    // color: new Color(0xffF5591F),
                    // gradient: LinearGradient(colors: [(new  Color(0xff01579b)), new Color(0xff006064)],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                    color: Colors.blue[800],
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
                              "OTP Verification",
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



                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   height: 54,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50),
                //     color: Colors.grey[200],
                //     boxShadow: [
                //       BoxShadow(
                //           offset: Offset(0, 10),
                //           blurRadius: 50,
                //           color: Color(0xffEEEEEE)
                //       ),
                //     ],
                //   ),
                //   child: TextField(
                //     cursorColor: Color(0xff006064),
                //     decoration: InputDecoration(
                //       icon: Icon(
                //         Icons.person,
                //         color: Color(0xff006064),
                //       ),
                //       hintText: "Full Name",
                //       enabledBorder: InputBorder.none,
                //       focusedBorder: InputBorder.none,
                //     ),
                //   ),
                // ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
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
                    child: TextField(
                      cursorColor: Color(0xff006064),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Colors.blue[800],
                        ),
                        hintText: "OTP sent on your Email ",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Createuser(),
                        )
                    );
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
                      "Verify",
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