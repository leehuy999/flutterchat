import 'package:intl/intl.dart';

String readTimestamp(int timestamp) {
  var now = new DateTime.now();
  var format = new DateFormat('HH:mm a');
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp*1000);
  var diff = date.difference(now);
  var time = '';

  if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date); // Doesn't get called when it should be
  } else {
    time = diff.inDays.toString() + 'DAYS AGO'; // Gets call and it's wrong date
  }

  return time;
}