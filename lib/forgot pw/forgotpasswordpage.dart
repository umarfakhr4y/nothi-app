import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/forgot%20pw/verificationpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgotPasswordPage(),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password',
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 43),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Please write your email so we can\nsend code verification',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerificationScreen()),
                );
              },
              // Add your onPressed code here
              child: Text('Send'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFFFF7373),
                backgroundColor: Color(0xFF801F1F), // Text Color (Foreground color)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded button
                ),
                padding: EdgeInsets.symmetric(horizontal: 193, vertical: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
