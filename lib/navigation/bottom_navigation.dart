import 'package:f1_app/latest.dart';
import 'package:f1_app/more.dart';
import 'package:f1_app/racing.dart';
import 'package:f1_app/standings.dart';
import 'package:f1_app/video.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({super.key});

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  List<Map<String, dynamic>> bottomItem = [
    {"Icon": FontAwesomeIcons.newspaper, "lable": "Latest"},
    {"Icon": FontAwesomeIcons.video, "lable": "Video"},
    {"Icon": FontAwesomeIcons.flagCheckered, "lable": "Racing"},
    {"Icon": FontAwesomeIcons.list, "lable": "Standings"},
    {"Icon": FontAwesomeIcons.ellipsisVertical, "lable": "More"},
  ];

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const Latest(),
    const Video(),
    const Racing(),
    const Standings(),
    const More(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 25),
        selectedIconTheme: const IconThemeData(color: Colors.red, size: 25),
        items: bottomItem
            .map(
              (e) => BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: FaIcon(e["Icon"]),
                ),
                label: e["lable"],
              ),
            )
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
