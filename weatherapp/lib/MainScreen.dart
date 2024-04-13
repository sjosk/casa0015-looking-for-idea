import 'package:flutter/material.dart';
import 'pages/weather_page.dart';
import 'pages/clock_page.dart';
import 'pages/calendar_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    ClockPage(),
    WeatherPage(),
    CalendarPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Icon(Icons.alarm, size: 30),
              ),
              label: 'Alarm',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Icons.cloud, size: 30),
                ),
                label: 'Weather'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(Icons.event, size: 30),
                ),
                label: 'Calendar'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(247, 160, 90, 1),
          backgroundColor: const Color.fromRGBO(39, 68, 76, 1),
          unselectedItemColor: Color.fromARGB(255, 197, 197, 197),
          onTap: _onItemTapped,
          selectedLabelStyle: TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}