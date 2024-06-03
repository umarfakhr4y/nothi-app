import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/Home/settings/general/connectedacc.dart';
import 'package:flutter_application_notihealth/Home/settings/general/editProfile.dart';
import 'package:flutter_application_notihealth/Home/settings/general/password.dart';

class displayPage extends StatefulWidget {
  const displayPage({super.key});

  @override
  State<displayPage> createState() => _displayPageState();
}

class _displayPageState extends State<displayPage> {
  @override
  bool isSwitched = true;
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFC59898),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xff801F1F),
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '         Display',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Color(0xffD8BABA),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *
                                0.6, // Adjust the width as needed
                            height: 45,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Dark mode',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Switch(
                            value: isSwitched, // Gunakan variabel state
                            onChanged: (bool newValue) {
                              setState(() {
                                isSwitched =
                                    newValue; // Perbarui variabel state ketika switch di-toggle
                              });
                            },
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
