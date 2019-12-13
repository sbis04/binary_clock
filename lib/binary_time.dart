import 'package:intl/intl.dart' show DateFormat;

class BinaryTime {
  List<String> binaryIntegers;

  BinaryTime() {
    DateTime now = DateTime.now();

    // The hours, minutes and seconds are seperated by a ":",
    // which we do not need in this case.

    // So, we will replace them with an empty string "".
    String hhmmss = DateFormat('Hms').format(now).replaceAll(':', '');

    // We have a string of length 6 from the hhmmss string

    // Now, we will need to seperate the stirng into hh, mm & ss
    // and convert them to binary.

    // If the string length is less then 4, then we are padding
    // on the left side with 0s.

    // Lastly, we are storing our binary hh, mm, ss to a List.
    binaryIntegers = hhmmss
        .split('')
        .map((str) => int.parse(str).toRadixString(2).padLeft(4, '0'))
        .toList();
  }

  get hourTens => binaryIntegers[0];
  get hourOnes => binaryIntegers[1];
  get minutesTens => binaryIntegers[2];
  get minutesOnes => binaryIntegers[3];
  get secondsTens => binaryIntegers[4];
  get secondsOnes => binaryIntegers[5];
}
