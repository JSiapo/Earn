import 'package:eran_by_saving/constants/operations_constants.dart';

class Operation {
  String name;
  String cardId;
  String dateStr;
  String icon;
  CURRENCY currency;
  OPERATION operation;
  double mount;
  bool isOffline = false;
  bool isExpense = true;

  Operation({
    required this.name,
    required this.cardId,
    required this.dateStr,
    required this.icon,
    required this.operation,
    required this.mount,
    required this.currency,
  });
}
