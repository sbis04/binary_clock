import 'dart:async';

import 'package:binary_clock/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'clock.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _visibility = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      setState(() {
        _visibility = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.of(context),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: Clock(),
            ),
            Visibility(
              visible: _visibility,
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: Text(
                    'TAP to go to DARK/LIGHT mode',
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
