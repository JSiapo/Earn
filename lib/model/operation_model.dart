import 'package:eran_by_saving/constants/operations_constants.dart';

class Operation {
  String id;
  String name;
  String description;
  String cardId;
  String accountNumber;
  String dateStr;
  String icon;
  CURRENCY currency;
  OPERATION operation;
  double mount;
  bool isOffline = false;
  bool isExpense = true;
  bool status = true;
  List<String> evidence = [];

  Operation({
    required this.id,
    required this.name,
    required this.description,
    required this.cardId,
    required this.accountNumber,
    required this.dateStr,
    required this.icon,
    required this.operation,
    required this.mount,
    required this.currency,
    required this.evidence,
  });
}
