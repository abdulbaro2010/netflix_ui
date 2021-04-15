import 'package:flutter/material.dart';
import 'package:netflex_ui/screens/screens.dart';

void main() {
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "Netflix",
       theme: ThemeData(
         primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
         scaffoldBackgroundColor: Colors.black,
       ),
       home: HomeScreen(),
       
     );
   }
 }

