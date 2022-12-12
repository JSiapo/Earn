import 'dart:math';

import 'package:eran_by_saving/model/operation_model.dart';
import 'package:eran_by_saving/repository/operation/operation_repository.dart';
import 'package:eran_by_saving/repository/operation/operation_repository_imp.dart';
import 'package:flutter/material.dart';

class OperationProvider extends ChangeNotifier {
  OperationRepository repository = OperationRepositoryImp();
  List<Operation> operations = [];
  List<Operation> operationsFiltered = [];
  List<Operation> operationsEarning = [];
  List<Operation> operationsExpenses = [];
  Operation? currentOperation;
  List<Map<String, dynamic>> dataWithLabels = [];

  setOperation(Operation operation) {
    currentOperation = operation;
    notifyListeners();
  }

  Future<void> getAll() async {
    try {
      operations = await repository.getAllOperation();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    operations = await repository.getAllOperation();
    notifyListeners();
  }

  findOperationsFiltered(String? id) {
    operationsFiltered =
        operations.where((operation) => operation.cardId == id).toList();
    getMounts();
    dataWithLabels = dataChart();
    notifyListeners();
  }

  clearAll() {
    operations = [];
    operationsFiltered = [];
    operationsEarning = [];
    operationsExpenses = [];
    currentOperation = null;
    notifyListeners();
  }

  List<Map<String, dynamic>> dataChart() {
    return operationsFiltered
        .map(
          (e) => {
            "color":
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
            "label": e.name,
            "id": e.id,
            "textColor": e.isExpense ? Colors.red : Colors.green,
          },
        )
        .toList();
  }

  getMounts() {
    operationsEarning = [];
    operationsExpenses = [];
    if (operationsFiltered.isEmpty) return;
    operationsEarning =
        operationsFiltered.where((element) => !element.isExpense).toList();
    operationsExpenses =
        operationsFiltered.where((element) => element.isExpense).toList();
  }
}
