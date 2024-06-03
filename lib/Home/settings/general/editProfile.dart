import 'dart:ffi';

import 'package:flutter/material.dart';

class editProfilePage extends StatefulWidget {
  const editProfilePage({super.key});

  @override
  State<editProfilePage> createState() => _editProfilePageState();
}

class _editProfilePageState extends State<editProfilePage> {
  String? _selectedGender;
  final TextEditingController _birthdayController = TextEditingController();
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
      backgroundColor: Colors.white,
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      dropdownColor: Color(
                          0xFFFFF1F1), // Warna latar belakang menu dropdown
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
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 420,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color(0xff801F1F),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_birthdayController.text == '' ||
                        _selectedGender == '') {
                      print('asdasd');
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color(0xff801F1F),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
