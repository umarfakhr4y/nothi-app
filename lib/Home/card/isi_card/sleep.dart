import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:progressive_time_picker/progressive_time_picker.dart';

class sleepPage extends StatefulWidget {
  const sleepPage({super.key});

  @override
  State<sleepPage> createState() => _sleepPageState();
}

class _sleepPageState extends State<sleepPage> {
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
          TimePickerWithClockDial(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 160,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xff801F1F),
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  'Start Sleep',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 300,
                height: 90,
                decoration: BoxDecoration(
                    color: Color(0xff994C4C),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    GestureDetector(
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTimebedtime,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );

                        if (pickedTime != null &&
                            pickedTime != selectedTimebedtime) {
                          setState(() {
                            selectedTimebedtime = pickedTime;
                          });
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bedtime',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            formatTime24(selectedTimebedtime),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTimealarm,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );

                        if (pickedTime != null &&
                            pickedTime != selectedTimealarm) {
                          setState(() {
                            selectedTimealarm = pickedTime;
                          });
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Alarm',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            formatTime24(selectedTimealarm),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTimenap,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );

                        if (pickedTime != null &&
                            pickedTime != selectedTimenap) {
                          setState(() {
                            selectedTimenap = pickedTime;
                          });
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nap',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            formatTime24(selectedTimenap),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 40,
                height: 90,
                decoration: BoxDecoration(
                    color: Color(0xff994C4C),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
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

class ClockDialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    Paint tickPaint = Paint()..color = Colors.grey;

    TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 1; i <= 12; i++) {
      var angle = pi / 6 * (i - 3);
      var x = centerX + radius * 0.8 * cos(angle);
      var y = centerY + radius * 0.8 * sin(angle);
      textPainter.text = TextSpan(
        text: i.toString(),
        style: TextStyle(color: Colors.grey, fontSize: 24),
      );
      textPainter.layout();
      textPainter.paint(canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TimePickerWithClockDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Clock Dial
        CustomPaint(
          size: Size(280, 280), // Assuming the TimePicker has these dimensions
          painter: ClockDialPainter(),
        ),
        // Text(
        //   '07:59',
        //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        // ),
        // TimePicker
        Container(
          height: 400,
          width: 400,
          child: TimePicker(
            initTime: PickedTime(h: 0, m: 0),
            endTime: PickedTime(h: 12, m: 0),
            decoration: TimePickerDecoration(
              baseColor: Color(0xffE0E0E0),
              sweepDecoration: TimePickerSweepDecoration(
                pickerStrokeWidth: 45,
                pickerColor: Color(0xff994C4C),
              ),
              initHandlerDecoration: TimePickerHandlerDecoration(
                  color: Colors.transparent,
                  icon: Icon(
                    Icons.dark_mode_sharp,
                    color: Colors.black,
                  )),
              endHandlerDecoration: TimePickerHandlerDecoration(
                  color: Colors.transparent,
                  icon: Icon(
                    Icons.alarm,
                    color: Colors.black,
                  )),
            ),
            onSelectionChange: (start, end, isDisableRange) => print(
                'onSelectionChange => init : ${start.h}:${start.m}, end : ${end.h}:${end.m}, isDisableRangeRange: $isDisableRange'),
            onSelectionEnd: (start, end, isDisableRange) => print(
                'onSelectionEnd => init : ${start.h}:${start.m}, end : ${end.h}:${end.m},, isDisableRangeRange: $isDisableRange'),
          ),
        ),
      ],
    );
  }
}
