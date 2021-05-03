import 'package:intl/intl.dart';

class GeneralUtil {
  final NumberFormat fCurrency = NumberFormat('#,###', 'id_ID');
  String intToCurrency(int inputNumber) {
    if (null == inputNumber) {
      return 'Rp. 0';
    }
    return 'Rp. ' + fCurrency.format(inputNumber);
  }
}
