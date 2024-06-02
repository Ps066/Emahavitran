import 'dart:developer';

import 'package:emahavitran/createuser.dart';
import 'package:emahavitran/emailver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  // TextEditingController userNameController = TextEditingController();
  // TextEditingController consumerNoController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPassController = TextEditingController();
  @override
  bool _isObscure = true;
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),

                // full name input field

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
                //   child: TextFormField(
                //     controller: userNameController,
                //     cursorColor: Color(0xff006064),
                //     decoration: InputDecoration(
                //       icon: Icon(
                //         Icons.person,
                //         color: Colors.blue[800],
                //       ),
                //       hintText: "Full Name",
                //       enabledBorder: InputBorder.none,
                //       focusedBorder: InputBorder.none,
                //     ),
                //   ),
                // ),
                // consumer number input field
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
                //   child: TextFormField(
                //     controller: consumerNoController,
                //     cursorColor: Color(0xff006064),
                //     decoration: InputDecoration(
                //       focusColor: Color(0xff006064),
                //       icon: Icon(
                //         Icons.article_rounded,
                //         color: Colors.blue[800],
                //       ),
                //       hintText: "Consumer Number",
                //       enabledBorder: InputBorder.none,
                //       focusedBorder: InputBorder.none,
                //     ),
                //   ),
                // ),

                // phone input field
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
                //         color: Colors.blue[800],
                //       ),
                //       hintText: "Phone Number",
                //       enabledBorder: InputBorder.none,
                //       focusedBorder: InputBorder.none,
                //     ),
                //   ),
                // ),

                // email input field
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
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
                    child: TextFormField(
                      controller: userEmailController,
                      cursorColor: Color(0xff006064),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.blue[800],
                        ),
                        hintText: "Email",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                // password input field
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffEEEEEE),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextFormField(
                    obscureText: _isObscure,
                    keyboardType: TextInputType.visiblePassword,
                    controller: userPassController,
                    cursorColor: Color(0xff006064),
                    decoration: InputDecoration(
                      focusColor: Color(0xff006064),
                      icon: Icon(
                        Icons.password,
                        color: Colors.blue[800],
                      ),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: (){
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),




                GestureDetector(
                  onTap: () async {
                    // Write Click Listener Code Here.
                    var userEmail = userEmailController.text.trim();
                    var userpass = userPassController.text.trim();

                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userpass).then((value) => {
                      log("User Created"),
                      Fluttertoast.showToast(
                        msg: "Registerd Successfully!",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey[800],
                        textColor: Colors.white,
                        fontSize: 16.0
                      ),
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => Createuser(),
                      )
                      )
                    });

                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(colors: [(new  Color(0xff01559b)), new Color(0xff006064)],
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
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      // onTap: () {
                      //   // Write Tap Code Here.
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => SignUpScreen(),
                      //       )
                      //   );
                      // },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have Already Member?  "),
                      GestureDetector(
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                            color: Color(0xff006064),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Write Tap Code Here.
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}