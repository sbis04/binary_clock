import 'dart:async';
import 'binary_time.dart';

import 'package:flutter/material.dart';

import 'clock_column.dart';
import 'theme/custom_theme.dart';
import 'theme/themes.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  BinaryTime _now = BinaryTime();
  bool isDark = false;

  // Tick the clock
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = BinaryTime();
      });
    });

    super.initState();
  }

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
    key == MyThemeKeys.DARK ? isDark = true : isDark = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: !isDark ? Colors.black : Colors.white,
      onTap: () {
        !isDark
            ? _changeTheme(context, MyThemeKeys.DARK)
            : _changeTheme(context, MyThemeKeys.LIGHT);
      },
      child: Container(
        padding: EdgeInsets.all(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClockColumn(
              binaryInteger: _now.hourTens,
              title: 'H',
              color: Colors.blue,
              rows: 2,
            ),
            ClockColumn(
              binaryInteger: _now.hourOnes,
              title: 'h',
              color: Colors.lightBlue,
            ),
            ClockColumn(
              binaryInteger: _now.minutesTens,
              title: 'M',
              color: Colors.green,
              rows: 3,
            ),
            ClockColumn(
              binaryInteger: _now.minutesOnes,
              title: 'm',
              color: Colors.lightGreen,
            ),
            ClockColumn(
              binaryInteger: _now.secondsTens,
              title: 'S',
              color: Colors.pink,
              rows: 3,
            ),
            ClockColumn(
              binaryInteger: _now.secondsOnes,
              title: 's',
              color: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }
}
