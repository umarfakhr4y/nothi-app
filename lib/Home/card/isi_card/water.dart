import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:progressive_time_picker/progressive_time_picker.dart';

class waterPage extends StatefulWidget {
  const waterPage({super.key});

  @override
  State<waterPage> createState() => _waterPageState();
}

class _waterPageState extends State<waterPage> {
  @override
  TimeOfDay selectedTimebedtime = TimeOfDay(hour: 22, minute: 0);
  TimeOfDay selectedTimealarm = TimeOfDay(hour: 06, minute: 0);
  TimeOfDay selectedTimenap = TimeOfDay(hour: 03, minute: 0);

  Widget build(BuildContext context) {
    int bedtimeInMinutes =
        selectedTimebedtime.hour * 60 + selectedTimebedtime.minute;
    int alarmInMinutes = selectedTimealarm.hour * 60 + selectedTimealarm.minute;
    int differenceInMinutes = alarmInMinutes - bedtimeInMinutes;

    String formatTime24(TimeOfDay time) {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');
      return "$hours:$minutes";
    }

    // Menghandle kasus melintasi tengah malam
    if (differenceInMinutes < 0) {
      differenceInMinutes += 24 * 60; // Tambahkan 24 jam jika hasil negatif
    }

    // Mengonversi selisih waktu kembali ke jam dan menit
    int hours = differenceInMinutes ~/ 60;
    int minutes = differenceInMinutes % 60;

    // Membuat string waktu
    String timeDifference =
        "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(45, 35, 16, 16),
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
          ),
          DateSelector(),
          Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
                color: Color(0xffC59898),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Water",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/bar_water.png',
                    scale: 0.7,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "     Input Ur Water",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            // height: 180,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
                color: Color(0xffC59898),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline_sharp,
                      color: Color(0xff6B3030),
                      size: 28,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      // Memastikan TextField mengambil ruang yang tersisa
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' Insert Water',

                          filled: true, // Aktifkan fill color
                          fillColor: Colors.white, // Warna background TextField
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            // Border untuk TextField
                            borderSide: BorderSide.none, // Tidak ada garis tepi
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'L',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      // Memastikan TextField mengambil ruang yang tersisa
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true, // Aktifkan fill color
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintText: ' 0',
                          fillColor: Colors.white, // Warna background TextField
                          border: OutlineInputBorder(
                            // Border untuk TextField
                            borderSide: BorderSide.none, // Tidak ada garis tepi
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline_sharp,
                      color: Color(0xff6B3030),
                      size: 28,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      // Memastikan TextField mengambil ruang yang tersisa
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' Insert Water',
                          filled: true, // Aktifkan fill color
                          fillColor: Colors.white, // Warna background TextField
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            // Border untuk TextField
                            borderSide: BorderSide.none, // Tidak ada garis tepi
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'L',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      // Memastikan TextField mengambil ruang yang tersisa
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' 0',
                          filled: true, // Aktifkan fill color
                          contentPadding: EdgeInsets.symmetric(vertical: 10),

                          fillColor: Colors.white, // Warna background TextField
                          border: OutlineInputBorder(
                            // Border untuk TextField
                            borderSide: BorderSide.none, // Tidak ada garis tepi
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Set Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          )
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
