import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/autentifikasi/signuppage.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class Homewomanpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderSection(),
            DateSelector(),
            HealthInfo(),
            TrackRecordButton(),
            BottomNavigation(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: Colors.red[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Syifa!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.cloud, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Cloudy\nJakarta, Indonesia',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'April 2024',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class DateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return DateCard(
            day: (index + 4).toString(),
            isSelected: index == 1,
          );
        }),
      ),
    );
  }
}

class DateCard extends StatelessWidget {
  final String day;
  final bool isSelected;

  DateCard({required this.day, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red[300] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Wed',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HealthInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HealthData(title: 'H/W Birth', data: '145/45\n12/9/04'),
                SizedBox(height: 20),
                HealthData(title: '', data: '1,763'),
                SizedBox(height: 8),
                HealthData(title: '', data: '1,2 L'),
                SizedBox(height: 8),
                HealthData(title: '', data: 'Happy'),
              ],
            ),
           SvgPicture.asset(
              'assets/svgs/woman.svg',
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}

class HealthData extends StatelessWidget {
  final String title;
  final String data;

  HealthData({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        SizedBox(height: 4),
        Text(
          data,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class TrackRecordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Your Track Record',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
        ),
      ],
    );
  }
}
