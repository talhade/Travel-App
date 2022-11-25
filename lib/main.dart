import 'package:flutter/material.dart';
import 'package:travel_app_ui/screens/home_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        scaffoldBackgroundColor: Color(0xFFF3F5F7), 
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFD8ECF1)),
      ),
      home: HomeScreen(),
    );
  }
}