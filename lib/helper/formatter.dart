import 'package:intl/intl.dart';

String dateFormatUI(DateTime date, {String? format}) {
  return DateFormat(format ?? "dd/MM/yyyy", 'id').format(date);
}
