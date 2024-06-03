import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/Home/viewTrackrecord.dart';
import 'package:flutter_application_notihealth/autentifikasi/signuppage.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class Homemanpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                    colors: [Color(0xffFFA1A1), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Column(
              children: [
                HeaderSection(),
                DateSelector(),
                HealthInfo(),
                // TrackRecordButton(),
                // BottomNavigation(),
              ],
            )));
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: Color(0xff994C4C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello Syifa!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'April 2024',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
                'Cloudy\nJakarta, Indonesia',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
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
        color: isSelected ? Color(0xff994C4C) : Colors.grey[200],
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
        // decoration: BoxDecoration(color: Colors.blue),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 180,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 1, offset: Offset(0, 1))
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'H/W\nBirth',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '145/45\n12/9/04',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset('assets/images/emot_api.png'),
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset('assets/images/emot_air.png'),
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset('assets/images/emot_smile.png'),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '1,763',
                                style: TextStyle(fontSize: 22),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '1,2L',
                                style: TextStyle(fontSize: 22),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Happy',
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 180,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 1, offset: Offset(0, 1))
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Your Track \nRecord',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => trackRecordPage()),
                              );
                            },
                            child: Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xff994C4C),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.navigate_next_sharp,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SvgPicture.asset(
              'assets/svgs/man.svg',
              width: 180,
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
