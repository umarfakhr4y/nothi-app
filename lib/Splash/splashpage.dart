import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_notihealth/autentifikasi/loginpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Loginpage(),
          ),
          (Route) => false);
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset('assets/svgs/background.svg'),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 185,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: "Hello User!",
                        style: GoogleFonts.poppins(
                            fontSize: 40,
                            color: Color(0xFF6B3030),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: "Lets get \nstarted",
                        style: GoogleFonts.poppins(
                            fontSize: 40,
                            color: Color(0xFF6B3030),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      'assets/svgs/panah.svg',
                      height: 65,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
