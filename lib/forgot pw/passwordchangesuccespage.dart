import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/autentifikasi/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Change Success Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PasswordChangeSuccessPage(),
    );
  }
}

class PasswordChangeSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                'Password Change\nSuccessfully!',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              CustomThinOutlineIcon(
                size: 100, // Ubah ukuran ikon sesuai kebutuhan
                color: Color(0xFF994C4C),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginpage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF994C4C),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xFF994C4C)),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 13),
                  shape: StadiumBorder(), // Menggunakan StadiumBorder untuk membuat tombol lebih rounded
                ),
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 18,
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

class CustomThinOutlineIcon extends StatelessWidget {
  final double size;
  final Color color;

  CustomThinOutlineIcon({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2), // Ubah width sesuai kebutuhan
          ),
        ),
        Icon(
          Icons.check,
          size: size * 0.6, // Ubah ukuran check icon sesuai kebutuhan
          color: color,
        ),
      ],
    );
  }
}
