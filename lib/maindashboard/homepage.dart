import 'package:aquila_android_application/getcurrentlocation/locationseraching.dart';
import 'package:aquila_android_application/profilepage/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../test/testshapefile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[

    // Text(
    //   'Index 0: Home',
    //   style: optionStyle,
    // ),
    //const ShapeReader(title: "home"),
    const testshape(),
    const LocationSearchUi(),
    const ProfileUI2(),

  ];

  @override
  void initState() {

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
       drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('AEG application'),
              ),
              ListTile(
                title: const Text('View areas'),
                onTap: () {

                },
              ),
              ListTile(
                title: const Text('Upload shapefiles data'),
                onTap: () {

                },
              ),
            ],
          ),
        ),
      body:  _widgetOptions.elementAt(_selectedIndex),


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.locationPin),
            label: 'places',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.info),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF096770),
        onTap: _onItemTapped,
      ),
    ));
  }
}




