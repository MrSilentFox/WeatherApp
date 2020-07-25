import 'package:intl/intl.dart';

class Util{
  static String getFormatDate(DateTime dateTime){
    return DateFormat('EEEE').format(dateTime);
  }
}