import 'dart:io';

import 'package:emahavitran/home.dart';
import 'package:emahavitran/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPassController = TextEditingController();
  // User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  bool _isObscure = true;
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
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
                              height: 130,
                              width: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Login",
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
                    controller: userEmailController,
                    cursorColor: Color(0xff006064),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.blue[800],
                      ),
                      hintText: "Enter Email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),

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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Write Click Listener Code Here
                    },
                    child: Text(
                        "Forget Password?",
                    style: TextStyle(
                        color: Color(0xff006064)
                    ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    // Write Click Listener Code Here.
                    var useremail = userEmailController.text.trim();
                    var userpass = userPassController.text.trim();
                    try{
                      final User? firebaseuser = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: useremail, password: userpass)).user;
                      if(firebaseuser != null){
                        Fluttertoast.showToast(
                            msg: "User Logged In Successfully!",
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey[800],
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                      }
                    } on FirebaseAuthException catch (e){
                      Fluttertoast.showToast(
                          msg: e!.message!,
                          toastLength: Toast.LENGTH_LONG,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey[800],
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      print("Error $e");
                    }
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
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have Any Account?  "),
                      GestureDetector(
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              color: Color(0xff006064),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Write Tap Code Here.
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              )
                          );
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