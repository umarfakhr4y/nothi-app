import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/forgot%20pw/passwordchangesuccespage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResetPasswordPage(),
    );
  }
}

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Reset Your Password',
               style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.normal, color: Colors.black,
                  ),
                ),
              SizedBox(height: 16),
               Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please write your new password',
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black,
                  ),
              ),
               ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '******',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordChangeSuccessPage(),
                  ),
                );
                  // Implement password reset functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF801F1F),
                  padding: EdgeInsets.symmetric(horizontal: 190, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Color(0xFFFF7373),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
