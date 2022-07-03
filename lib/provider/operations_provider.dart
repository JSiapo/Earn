import 'package:eran_by_saving/constants/operations_constants.dart';
import 'package:eran_by_saving/model/operation_model.dart';
import 'package:flutter/material.dart';

class OperationProvider extends ChangeNotifier {
  List<Operation> operations = [];
  List<Operation> operationsFiltered = [];

  Future<void> getAll() async {
    operations = [
      Operation(
        name: "Hidrandina",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        dateStr: "02/07/2022",
        mount: 125.20,
        icon: "boltLightning",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
      ),
      Operation(
        name: "Sedalib",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        dateStr: "02/07/2022",
        mount: 125.20,
        icon: "droplet",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
      ),
      Operation(
        name: "Claro",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        dateStr: "02/07/2022",
        mount: 125.20,
        icon: "wifi",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
      ),
      Operation(
        name: "Quavi",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        dateStr: "02/07/2022",
        mount: 125.20,
        icon: "fireFlameCurved",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
      ),
      Operation(
        name: "Quavi",
        cardId: "3a9bb15e-57a0-4df4-985e-63902c5eecf1",
        dateStr: "02/07/2022",
        mount: 125.20,
        icon: "fireFlameCurved",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
      )..isOffline = true,
      Operation(
        name: "YAWI",
        cardId: "298ac65c-7021-4b9b-97c7-f3818185bf2b",
        dateStr: "01/07/2022",
        mount: 1000.00,
        icon: "building",
        operation: OPERATION.pay,
        currency: CURRENCY.PEN,
      )..isExpense = false,
      Operation(
        name: "FOCUS",
        cardId: "4859b7f2-3c67-4dd3-b477-3f760c7972a0",
        dateStr: "02/07/2022",
        mount: 187.50,
        icon: "building",
        operation: OPERATION.pay,
        currency: CURRENCY.USD,
      )..isExpense = false
    ];
  }

  findOperationsFiltered(String? id) {
    operationsFiltered =
        operations.where((operation) => operation.cardId == id).toList();
    notifyListeners();
  }
}
