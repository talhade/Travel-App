// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, duplicate_ignore, import_of_legacy_library_into_null_safe, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/widgets/hotel_carousel.dart';

import '../widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Theme.of(context).colorScheme.secondary :Color(0xFFE7EBEE) ,
          borderRadius: BorderRadius.circular(30),),
          child: Icon(_icons[index],
        size: 25.0,
        color: _selectedIndex == index ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text("What would you like to find?",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons.asMap().entries.map((MapEntry map) => _buildIcon(map.key),).toList(),
          ),
          SizedBox(height: 20,),
          DestinationCarousel(),
          SizedBox(height: 20,),
          HotelCarousel(),
        ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab = value; 
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 30.0,), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.money, size: 30.0,), label: 'Money'),
          BottomNavigationBarItem(icon: CircleAvatar(radius: 15.0,backgroundImage: AssetImage('assets/images/user_avatar.jpg'),), label: 'User'),

        ],
        ),
    );
  }
}
