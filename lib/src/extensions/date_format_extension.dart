import 'package:intl/intl.dart';

extension DateFormatExtension on String {
  String get formattedDate {
    if(isEmpty) return '';
    return DateFormat("EEEE, dd 'de' MMMM", "pt_BR").format(DateTime.parse(this));
  }
}