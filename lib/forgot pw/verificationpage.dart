import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_notihealth/forgot%20pw/resetpasswordpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerificationScreen(),
    );
  }
}

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  int _resendTimeout = 20;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (index) => TextEditingController());
    _focusNodes = List.generate(4, (index) => FocusNode());
    startResendTimer();
  }

  void startResendTimer() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (_resendTimeout > 0) {
          _resendTimeout--;
          startResendTimer();
        } else {
          _canResend = true;
        }
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Widget buildCodeField(int index) {
    return Container(
      width: 50,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            Text(
              'Verification',
               style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.normal, color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Check your email box to see the verification code',
               style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => buildCodeField(index)),
            ),
            SizedBox(height: 20),
          
            Text(
              _canResend ? 'Resend?' : 'Resend? $_resendTimeout Sec',
               style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordPage(),
                  ),
                );
              },
                // Handle Done button press
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFFFF7373),
                backgroundColor: Color(0xFF801F1F),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Done'),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: _canResend
                  ? () {
                      // Handle Resend button press
                      setState(() {
                        _resendTimeout = 20;
                        _canResend = false;
                        startResendTimer();
                      });
                    }
                  : null,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFF801F1F)),
                foregroundColor: Color(0xFF801F1F),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Resend'),
            ),
          ],
        ),
      ),
    );
  }
}
