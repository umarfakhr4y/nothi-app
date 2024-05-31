import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/autentifikasi/signuppage.dart';

void main() {
  runApp(MyApp());
}

class Homemanpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with greeting and date
            Container(
              color: Colors.brown[300],
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hello Syifa!',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'April 2024',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.cloud, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Cloudy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Jakarta, Indonesia',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return Column(
                        children: [
                          Text(
                            ['4', '5', '6', '7', '8', '9'][index],
                            style: TextStyle(
                              color: index == 1 ? Colors.white : Colors.grey[400],
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            ['Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
                            style: TextStyle(
                              color: index == 1 ? Colors.white : Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Health and Wellness Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('H/W'),
                          Text('Birth'),
                          SizedBox(height: 8),
                          Text('145/45'),
                          Text('12/9/04'),
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(height: 4),
                          Text('1,763'),
                          SizedBox(height: 16),
                          Icon(Icons.local_drink, color: Colors.blue),
                          SizedBox(height: 4),
                          Text('1.2 L'),
                          SizedBox(height: 16),
                          Icon(Icons.mood, color: Colors.orange),
                          SizedBox(height: 4),
                          Text('Happy'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Your Track Record'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.brown[300],
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        selectedItemColor: Colors.brown[300],
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
