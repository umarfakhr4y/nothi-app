import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/Home/card/card.dart';
import 'package:flutter_application_notihealth/Home/homemanpage.dart';
import 'package:flutter_application_notihealth/Home/settings/settings.dart';
import 'package:flutter_application_notihealth/autentifikasi/signuppage.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class navbarHome extends StatefulWidget {
  @override
  _navbarHomeState createState() => _navbarHomeState();
}

class _navbarHomeState extends State<navbarHome> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Homemanpage(),
    cardPage(),
    settingsPage(), // Pastikan ini diaktifkan kembali jika ingin ditampilkan
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff994C4C),
          iconSize: 40,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_vert),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
