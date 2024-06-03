import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/Home/settings/general/connectedacc.dart';
import 'package:flutter_application_notihealth/Home/settings/general/display.dart';
import 'package:flutter_application_notihealth/Home/settings/general/editProfile.dart';
import 'package:flutter_application_notihealth/Home/settings/general/language.dart';
import 'package:flutter_application_notihealth/Home/settings/general/notificaton.dart';
import 'package:flutter_application_notihealth/Home/settings/general/password.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC59898),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xff801F1F),
                  borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: EdgeInsets.only(right: 200),
                child: Center(
                  child: Text(
                    'Setings',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
                    height: 230,
                    decoration: BoxDecoration(
                        color: Color(0xffD8BABA),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => editProfilePage()),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => connectedAccPage()),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Connection Account',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => passwordPage()),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                        color: Color(0xffD8BABA),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => notificationPage()),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Notification',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => displayPage()),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Display',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => languagePage()),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Language',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
