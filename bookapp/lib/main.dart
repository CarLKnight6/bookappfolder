


import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SearchResultScreen.dart';
import 'SearchBarScreen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

Future <void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
// void main()  {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
             title: 'Bookphilia',
             initialRoute:  '/',
             routes: {
               '/' :(context) => HomeScreen(),
               '/SearchScreen' : (context) => SearchResultScreen(),
               '/SearchBar': (context) => SearchBarScreen(),
             },


    );
  }
}
//COPYRIGHTS to JESUS CARL B. SANCHEJA @CarLKnightCOPH


