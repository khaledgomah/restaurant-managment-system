import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  final day = DateFormat('d').format(dateTime); // 28
  final month = DateFormat('MMMM').format(dateTime); // October
  final year = DateFormat('y').format(dateTime); // 2021


  return '$day $month $year';
}String formatTime(DateTime dateTime) {

  final weekday = DateFormat('EEEE').format(dateTime); // Thursday
  final time = DateFormat('HH:mm').format(dateTime); // 17:30

  return ' $weekday | $time';
}
