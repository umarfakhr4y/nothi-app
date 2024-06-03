import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/Home/homemanpage.dart';
import 'package:flutter_application_notihealth/Home/homewomanpage.dart';
import 'package:flutter_application_notihealth/Home/navbar.dart';
import 'package:flutter_application_notihealth/Home/navbarcwk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFB55252),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFB55252),
          onPrimary: Colors.white, // Text color for primary color
          onSurface: Colors.black, // Default text color
        ),
        datePickerTheme: DatePickerThemeData(
          headerBackgroundColor: Color(0xFFB55252),
          dayOverlayColor:
              MaterialStateProperty.all(Color(0xFFB55252).withOpacity(0.2)),
          rangePickerBackgroundColor: Color(0xFFB55252),
        ),
      ),
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _birthdayController = TextEditingController();
  String? _selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Set initial date to today
      firstDate: DateTime(1900), // Set the earliest date you can pick
      lastDate: DateTime(2101), // Set the latest date you can pick
    );
    if (picked != null && picked != DateTime.now())
      setState(() {
        _birthdayController.text = "${picked.toLocal()}".split(' ')[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 1), // Warna putih
              Color.fromRGBO(216, 186, 186, 1), // Warna abu-abu kemerahan
              Color.fromRGBO(255, 255, 255, 1), // Warna putih lagi
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Welcome to Noti-Health! We would like to know you more!',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Icon(Icons.waving_hand, size: 32),
                            Icon(Icons.info_outline, size: 32),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  TextField(
                    controller: _birthdayController,
                    decoration: const InputDecoration(
                      labelText: 'Birthday',
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true, // Prevents user from typing
                    onTap: () => _selectDate(
                        context), // Shows the date picker when the field is tapped
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                      fillColor:
                          Colors.transparent, // Warna latar belakang dropdown
                      filled: true,
                    ),
                    dropdownColor:
                        Color(0xFFFFF1F1), // Warna latar belakang menu dropdown
                    value: _selectedGender,
                    items: <String>['Female', 'Male'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Height',
                            border: OutlineInputBorder(),
                            suffixText: 'cm', // Label for height
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Weight',
                            border: OutlineInputBorder(),
                            suffixText: 'kg', // Label for weight
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color.fromRGBO(150, 0, 0, 1), // Warna tombol merah
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 160, vertical: 15),
                      ),
                      onPressed: () {
                        if (_selectedGender == 'Male') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => navbarHome()),
                          );
                        } else if (_selectedGender == 'Female') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => navbarHomedua()),
                          );
                        }
                      },
                      child: Text('Done'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
