import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emahavitran/home.dart';
import 'package:emahavitran/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:emahavitran/maps.dart';




class Powertheftalert extends StatefulWidget {
  const Powertheftalert({Key? key}) : super(key: key);

  @override
  State<Powertheftalert> createState() => _PowertheftalertState();
}

class _PowertheftalertState extends State<Powertheftalert> {



  LocationData? currentLocation;
  User? currentUser = FirebaseAuth.instance.currentUser;

  // Future<void> getCurrentLocation() async {
  //   Location location = new Location();
  //
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //   location.getLocation().then((location) => {
  //     currentLocation = location
  //   });
  // }

  // void initstate(){
  //   getCurrentLocation();
  //   super.initState();
  // }

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
  String imageUrl='';
  String billUrl='';

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result==null) return;

    setState(() {
      pickedFile = result.files.first;
    });
}

  Future uploadFile() async{
    final path = await 'Power theft Bills/${pickedFile!.name}';
    final file = await File(pickedFile!.path!);
    final refs = await FirebaseStorage.instance.ref().child(path);
    uploadTask = refs.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});
    final urldownload = await snapshot.ref.getDownloadURL();
    billUrl = urldownload;

    Fluttertoast.showToast(
        msg: "Scanned Bill uploaded Successfully!",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0
    );

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
                  GestureDetector(
                    onTap: (){
                      // print(currentLocation!.latitude);
                      // print(currentLocation!.longitude);
                      _getCurrentLocation().then((value) {
                        lat = '${value.latitude}';
                        long = '${value.longitude}';
                      });
                      var glink = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
                      print(glink);
                      print(lat);
                      print(long);
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
                                'Alert Power Theft',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                            ),
                            // Icon(Icons.more_horiz),
                          ],
                        ),


                      ),


                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Add Photograph of\nyour Meter",
                                          style: TextStyle(
                                            color:Colors.black,
                                            fontSize:20,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),

                                    ],
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      ImagePicker imagePicker = ImagePicker();
                                      XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
                                      print('${image?.path}');
                                      if(image==null) return;
                                      var uimg =  DateTime.now().microsecondsSinceEpoch.toString();

                                      //upload image
                                      Reference referenceRoot = FirebaseStorage.instance.ref();
                                      Reference referenceDirImages = referenceRoot.child("Power theft Images");

                                      Reference imageRef = referenceDirImages.child(uimg);

                                      try{
                                        await imageRef.putFile(File(image!.path));
                                        imageUrl =  await imageRef.getDownloadURL();
                                        Fluttertoast.showToast(
                                            msg: "Image Uploaded Successfully!",
                                            toastLength: Toast.LENGTH_LONG,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.grey[800],
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                      }catch(error){
                                        //error
                                      }

                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue[600],
                                          borderRadius: BorderRadius.circular(10),

                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.camera,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Upload PDF Copy\nof Your Light Bill",
                                          style: TextStyle(
                                            color:Colors.black,
                                            fontSize:20,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),

                                    ],
                                  ),
                                  InkWell(
                                    onTap: (){
                                      selectFile();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[600],
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.file_copy,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      uploadFile();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[600],
                                        borderRadius: BorderRadius.circular(10),

                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.upload,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
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
                                await FirebaseFirestore.instance.collection("Power theft Compalints").doc().set({
                                  'userId': currentUser!.uid,
                                  'Title': titletxt,
                                  'Problem' : problemtxt,
                                  'emailid': currentUser!.email,
                                  'meter image': imageUrl,
                                  'scanned bill': billUrl,
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
